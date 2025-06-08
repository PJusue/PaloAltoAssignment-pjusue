output "report_name" {
  description = "The name of the Cost and Usage Report"
  value       = aws_cur_report_definition.this.report_name
}

output "s3_bucket" {
  description = "The S3 bucket where reports are stored"
  value       = aws_cur_report_definition.this.s3_bucket
}

output "arn" {
  description = "The ARN of the Cost and Usage Report"
  value       = aws_cur_report_definition.this.arn
}