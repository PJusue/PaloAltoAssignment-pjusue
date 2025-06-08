output "id" {
  description = "The ID of the alarm"
  value       = aws_cloudwatch_metric_alarm.this.id
}

output "arn" {
  description = "The ARN of the alarm"
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "name" {
  description = "The name of the alarm"
  value       = aws_cloudwatch_metric_alarm.this.alarm_name
}
