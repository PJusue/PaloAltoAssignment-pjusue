output "alb_id" {
  description = "The ID of the ALB"
  value       = aws_lb.main.id
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.main.dns_name
}

output "alb_zone_id" {
  description = "The canonical hosted zone ID of the ALB"
  value       = aws_lb.main.zone_id
}

output "target_group_arns" {
  description = "List of target group ARNs"
  value       = aws_lb_target_group.main[*].arn
}

output "target_group_names" {
  description = "List of target group names"
  value       = aws_lb_target_group.main[*].name
}

output "listener_arns" {
  description = "List of listener ARNs"
  value       = aws_lb_listener.main[*].arn
}

output "https_listener_arn" {
  description = "The ARN of the HTTPS listener (if it exists)"
  value       = try(aws_lb_listener.main[index(aws_lb_listener.main[*].protocol, "HTTPS")].arn, null)
}

output "http_listener_arn" {
  description = "The ARN of the HTTP listener (if it exists)"
  value       = try(aws_lb_listener.main[index(aws_lb_listener.main[*].protocol, "HTTP")].arn, null)
}
