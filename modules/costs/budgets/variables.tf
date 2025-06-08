variable "name" {
  description = "Name of the budget"
  type        = string
}

variable "budget_type" {
  description = "Type of budget (COST, USAGE, RI_UTILIZATION, etc.)"
  type        = string
  default     = "COST"
}

variable "limit_amount" {
  description = "The amount of cost or usage being measured"
  type        = string
}

variable "limit_unit" {
  description = "Unit of measurement for limit amount"
  type        = string
  default     = "USD"
}

variable "time_period_start" {
  description = "Start date for the budget"
  type        = string
}

variable "time_unit" {
  description = "Time unit for the budget (MONTHLY, QUARTERLY, ANNUALLY)"
  type        = string
  default     = "MONTHLY"
}

variable "cost_filter_name" {
  description = "Name of the cost filter"
  type        = string
}

variable "cost_filter_values" {
  description = "Values for the cost filter"
  type        = list(string)
}

variable "notification_comparison_operator" {
  description = "Comparison operator for notification"
  type        = string
  default     = "GREATER_THAN"
}

variable "notification_threshold" {
  description = "Threshold for notification"
  type        = number
  default     = 80
}

variable "notification_threshold_type" {
  description = "Type of threshold (PERCENTAGE, ABSOLUTE_VALUE)"
  type        = string
  default     = "PERCENTAGE"
}

variable "notification_type" {
  description = "Type of notification (ACTUAL, FORECASTED)"
  type        = string
  default     = "ACTUAL"
}

variable "subscriber_email_addresses" {
  description = "Email addresses to notify"
  type        = list(string)
}