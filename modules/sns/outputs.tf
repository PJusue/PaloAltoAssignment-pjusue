output "arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.this.arn
}

output "id" {
  description = "The ID of the SNS topic"
  value       = aws_sns_topic.this.id
}

output "name" {
  description = "The name of the SNS topic"
  value       = aws_sns_topic.this.name
}
