resource "aws_wafv2_web_acl" "this" {
  name        = var.name
  description = var.description
  scope       = var.scope

  default_action {
    dynamic "allow" {
      for_each = try(var.default_action.allow, null) != null ? [1] : []
      content {}
    }
    dynamic "block" {
      for_each = try(var.default_action.block, null) != null ? [1] : []
      content {}
    }
  }

  dynamic "rule" {
    for_each = var.rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

      dynamic "override_action" {
        for_each = try(rule.value.override_action, null) != null ? [1] : []
        content {
          dynamic "none" {
            for_each = try(rule.value.override_action.none, null) != null ? [1] : []
            content {}
          }
          dynamic "count" {
            for_each = try(rule.value.override_action.count, null) != null ? [1] : []
            content {}
          }
        }
      }

      dynamic "action" {
        for_each = try(rule.value.action, null) != null ? [1] : []
        content {
          dynamic "allow" {
            for_each = try(rule.value.action.allow, null) != null ? [1] : []
            content {}
          }
          dynamic "block" {
            for_each = try(rule.value.action.block, null) != null ? [1] : []
            content {}
          }
          dynamic "count" {
            for_each = try(rule.value.action.count, null) != null ? [1] : []
            content {}
          }
        }
      }

      statement {
        dynamic "managed_rule_group_statement" {
          for_each = try(rule.value.statement.managed_rule_group_statement, null) != null ? [rule.value.statement.managed_rule_group_statement] : []
          content {
            name        = managed_rule_group_statement.value.name
            vendor_name = managed_rule_group_statement.value.vendor_name
          }
        }

        dynamic "rate_based_statement" {
          for_each = try(rule.value.statement.rate_based_statement, null) != null ? [rule.value.statement.rate_based_statement] : []
          content {
            limit              = rate_based_statement.value.limit
            aggregate_key_type = rate_based_statement.value.aggregate_key_type
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = rule.value.visibility_config.cloudwatch_metrics_enabled
        metric_name               = rule.value.visibility_config.metric_name
        sampled_requests_enabled  = rule.value.visibility_config.sampled_requests_enabled
      }
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.visibility_config.cloudwatch_metrics_enabled
    metric_name               = var.visibility_config.metric_name
    sampled_requests_enabled  = var.visibility_config.sampled_requests_enabled
  }

  tags = var.tags
}

resource "aws_wafv2_web_acl_association" "this" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.this.arn
}

