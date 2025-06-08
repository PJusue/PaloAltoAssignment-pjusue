variable "task_definition_family" {
  description = "A unique name for your task definition"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "Docker image to use for the container"
  type        = string
}

variable "container_cpu" {
  description = "The number of cpu units to reserve for the container"
  type        = number
  default     = 256
}


variable "container_memory" {
  description = "The amount of memory (in MiB) to allow the container to use"
  type        = number
  default     = 512
}

variable "task_cpu" {
  description = "The number of cpu units to reserve for the task"
  type        = number
  default     = 256
}


variable "task_memory" {
  description = "The amount of memory (in MiB) to allow the task to use"
  type        = number
  default     = 512
}
variable "portMappings" {
  description = "Port mappings for the container"
  type = list(object({
    containerPort = number
    hostPort      = number
  }))
  default = []
}

variable "environment_variables" {
  description = "The environment variables to pass to the container"
  type        = list(map(string))
  default     = []
}

variable "requires_compatibilities"{
  description = "The launch type required by the task"
  type        = list(string)
  default     = ["FARGATE"]
}
variable "network_mode" {
  description = "The Docker networking mode to use for the containers in the task"
  type        = string
  default     = "awsvpc"
}

variable "execution_role_arn" {
  description = "ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
  type        = string
}

variable "logConfiguration"{
  type= object({
    logDriver = string
    options = map(string)
  })
}