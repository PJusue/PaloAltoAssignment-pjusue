resource "aws_budgets_budget" "this" {
  name              = var.name
  budget_type       = var.budget_type
  limit_amount      = var.limit_amount
  limit_unit        = var.limit_unit
  time_period_start = var.time_period_start
  time_unit         = var.time_unit

  cost_filter {
    name   = var.cost_filter_name
    values = var.cost_filter_values
  }

  notification {
    comparison_operator        = var.notification_comparison_operator
    threshold                  = var.notification_threshold
    threshold_type             = var.notification_threshold_type
    notification_type          = var.notification_type
    subscriber_email_addresses = var.subscriber_email_addresses
  }
}