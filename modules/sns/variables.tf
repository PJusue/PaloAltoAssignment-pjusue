variable "name" {
  description = "The name of the SNS topic"
  type        = string
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key for Amazon SNS or a custom CMK"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the SNS topic"
  type        = map(string)
  default     = {}
}

variable "subscriptions" {
  description = "A list of subscription objects"
  type = list(object({
    protocol = string
    endpoint = string
  }))
  default = []
}
