output "id" {
  description = "ID of the budget"
  value       = aws_budgets_budget.this.id
}

output "arn" {
  description = "ARN of the budget"
  value       = aws_budgets_budget.this.arn
}

output "name" {
  description = "Name of the budget"
  value       = aws_budgets_budget.this.name
}