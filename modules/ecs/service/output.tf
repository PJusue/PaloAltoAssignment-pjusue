output "id" {
  description = "The ID of the ECS service"
  value       = aws_ecs_service.main.id
}

output "name" {
  description = "The name of the ECS service"
  value       = aws_ecs_service.main.name
}

output "cluster" {
  description = "The cluster ID of the ECS service"
  value       = aws_ecs_service.main.cluster
}

output "service_name" {
  description = "The name of the ECS service"
  value       = aws_ecs_service.main.name
}

output "task_definition" {
  description = "The task definition ARN of the ECS service"
  value       = aws_ecs_service.main.task_definition
}

output "desired_count" {
  description = "The desired count of the ECS service"
  value       = aws_ecs_service.main.desired_count
}
