variable "name" {
  description = "Name for the auto scaling resources"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "min_capacity" {
  description = "Minimum capacity for the ECS service"
  type        = number
}

variable "max_capacity" {
  description = "Maximum capacity for the ECS service"
  type        = number
}

variable "scaling_policies" {
  description = "List of scaling policies to create"
  type = list(object({
    name                            = string
    policy_type                    = string
    target_value                   = number
    scale_in_cooldown              = number
    scale_out_cooldown             = number
    predefined_metric_specification = object({
      predefined_metric_type = string
    })
  }))
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}