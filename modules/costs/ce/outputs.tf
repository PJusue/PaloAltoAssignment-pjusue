output "arn" {
  description = "ARN of the cost category"
  value       = aws_ce_cost_category.this.arn
}

output "id" {
  description = "ID of the cost category"
  value       = aws_ce_cost_category.this.id
}

output "effective_start" {
  description = "Effective start date of the cost category"
  value       = aws_ce_cost_category.this.effective_start
}