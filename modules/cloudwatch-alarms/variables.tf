variable "alarm_name" {
  description = "The name for the alarm"
  type        = string
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified statistic and threshold"
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
}

variable "metric_name" {
  description = "The name of the metric to monitor"
  type        = string
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric"
  type        = string
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
  default     = 300
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric"
  type        = string
}

variable "threshold" {
  description = "The value against which the specified statistic is compared"
  type        = number
}

variable "alarm_description" {
  description = "The description for the alarm"
  type        = string
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state"
  type        = list(string)
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric"
  type        = map(string)
}
