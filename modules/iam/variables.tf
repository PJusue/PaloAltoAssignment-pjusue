variable "name" {
  description = "Name prefix for IAM roles"
  type        = string
}

variable "assume_role_policy" {
  description = "IAM policy JSON for assume role"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}