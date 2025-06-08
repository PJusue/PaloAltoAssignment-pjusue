variable "name" {
  description = "Name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "ID of the ECS cluster"
  type        = string
}

variable "task_definition_arn" {
  description = "ARN of the task definition"
  type        = string
}

variable "desired_count" {
  description = "Number of instances of the task to place and keep running"
  type        = number
  default     = 1
}

variable "iam_role" {
  description = "ARN of IAM role for the service"
  type        = string
}

variable "ordered_placement_strategy" {
  description = "Service level strategy rules for task placement"
  type = list(object({
    type  = string
    field = string
  }))
  default = []
}

variable "load_balancer" {
  description = "Load balancer configuration for the service"
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  })
}

variable "placement_constraints" {
  description = "Rules that are taken into consideration during task placement"
  type = list(object({
    type       = string
    expression = string
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to add to the service"
  type        = map(string)
  default     = {}
}

variable "network_configuration" {
  description = "Network configuration for the service"
  type = object({
    subnets          = list(string)
    security_groups  = list(string)
    assign_public_ip = bool
  })
}

variable "launch_type"{
  description = "Launch type for the service"
  type        = string
  default     = "FARGATE"
}