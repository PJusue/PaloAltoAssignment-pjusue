output "target_id" {
  description = "ID of the Application Auto Scaling Target"
  value       = aws_appautoscaling_target.this.id
}

output "policy_arns" {
  description = "ARNs of the Application Auto Scaling Policies"
  value       = { for k, v in aws_appautoscaling_policy.this : k => v.arn }
}