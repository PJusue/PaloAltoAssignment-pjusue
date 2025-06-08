output "arn" {
  description = "ARN of the certificate"
  value       = aws_acm_certificate.main.arn
}

output "domain_validation_options" {
  description = "Domain validation options"
  value       = aws_acm_certificate.main.domain_validation_options
}

    