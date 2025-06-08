variable "name" {
  description = "Name of the WAF Web ACL"
  type        = string
}

variable "description" {
  description = "Description of the WAF Web ACL"
  type        = string
}

variable "scope" {
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application"
  type        = string
}

variable "default_action" {
  description = "Default action for the WAF Web ACL"
  type        = any
}

variable "rules" {
  description = "List of WAF rules"
  type        = any
}

variable "visibility_config" {
  description = "Visibility config for WAF web ACL"
  type = object({
    cloudwatch_metrics_enabled = bool
    metric_name               = string
    sampled_requests_enabled  = bool
  })
}

variable "alb_arn" {
  description = "ARN of the ALB to associate with the WAF web ACL"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to assign to the WAF web ACL"
  type        = map(string)
  default     = {}
}

variable "enable_logging"{
  description = "Enable logging for the WAF web ACL"
  type        = bool
  default     = false

}
variable "log_name"{
  description = "Name of the WAF web ACL log"
  type        = string
  default     = null
}
variable "log_retention_days"{
  description = "Number of days to retain the WAF web ACL log"
  type        = number
  default     = 30
}