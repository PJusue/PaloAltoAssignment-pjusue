variable "description" {
  type        = string
  description = "Description for the KMS key"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Duration in days after which the key is deleted after destruction of the resource"
  default     = 7
}

variable "policy" {
  type        = string
  description = "A valid KMS key policy JSON document"
}