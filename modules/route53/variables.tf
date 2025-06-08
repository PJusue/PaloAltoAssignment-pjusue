variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Route 53 hosted zone"
  type        = map(string)
  default     = {}
}