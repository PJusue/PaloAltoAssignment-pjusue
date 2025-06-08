module "waf" {
  source = "../../modules/waf"

  name        = "alb-waf"
  description = "WAF for ALB protection"
  scope       = "REGIONAL"
  alb_arn     = module.alb-palo-alto.alb_arn
  
  default_action = {
    allow = {}
  }

  rules = [
    {
      name     = "AWSManagedRulesCommonRuleSet"
      priority = 1
      override_action = {
        none = {}
      }
      statement = {
        managed_rule_group_statement = {
          name        = "AWSManagedRulesCommonRuleSet"
          vendor_name = "AWS"
        }
      }
      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name               = "AWSManagedRulesCommonRuleSetMetric"
        sampled_requests_enabled  = true
      }
    },
    {
      name     = "AWSManagedRulesSQLiRuleSet"
      priority = 2
      override_action = {
        none = {}
      }
      statement = {
        managed_rule_group_statement = {
          name        = "AWSManagedRulesSQLiRuleSet"
          vendor_name = "AWS"
        }
      }
      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name               = "AWSManagedRulesSQLiRuleSetMetric"
        sampled_requests_enabled  = true
      }
    },
    {
      name     = "RateLimit"
      priority = 3
      action = {
        block = {}
      }
      statement = {
        rate_based_statement = {
          limit              = 2000
          aggregate_key_type = "IP"
        }
      }
      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name               = "RateLimitMetric"
        sampled_requests_enabled  = true
      }
    }
  ]

  visibility_config = {
    cloudwatch_metrics_enabled = true
    metric_name               = "WAFWebACLMetric"
    sampled_requests_enabled  = true
  }
  enable_logging     = true
  log_retention_days = 30  
  log_name = "waflogs"
  tags = {
    Environment = "Production"
    Project     = "ECS-PaloAlto"
  }
}
