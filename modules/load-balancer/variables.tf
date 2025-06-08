
variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "internal" {
  description = "Is this an internal ALB"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID where ALB will be created"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "target_groups" {
  description = "A list of target group configurations"
  type = list(object({
    port        = number
    protocol    = string
    target_type = string
    health_check = object({
      enabled             = bool
      healthy_threshold   = number
      interval            = number
      matcher             = string
      path                = string
      port                = string
      protocol            = string
      timeout             = number
      unhealthy_threshold = number
    })
  }))
}

variable "listeners" {
  description = "A list of listener configurations"
  type = list(object({
    port            = number
    protocol        = string
    ssl_policy      = string
    certificate_arn = string
    default_action = object({
      type               = string
      target_group_index = number
      redirect = object({
        port        = string
        protocol    = string
        status_code = string
      })
    })
  }))
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
