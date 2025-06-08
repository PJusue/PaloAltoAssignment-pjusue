variable "domain_name" {
  description = "Domain name for the certificate"
  type        = string
}

variable "subject_alternative_names" {
  description = "Additional domain names for the certificate"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Which method to use for validation (DNS or EMAIL)"
  type        = string
  default     = "EMAIL"
}

variable "tags" {
  description = "Tags to apply to the certificate"
  type        = map(string)
  default     = {}
}

variable "zone_id" {
  description = "Route53 zone ID for the domain"
  type        = string
  default     = ""
}

variable "validate_acm"{
  description = "Whether to validate the certificate with ACM"
  type        = bool
  default     = false

}