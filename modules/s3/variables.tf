variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to be applied to the bucket"
  type        = map(string)
  default     = {}
}
variable "policy"{
  description = "policy to be applied to the bucket"
  type        = string
  default     = ""

}
variable "type"{
  description = "type of principal"
  type        = string
  default     = "private"
}

variable "identifiers"{
  description = "list of identifiers for bucket policy"
  type        = list(string)
  default     = []
}
variable "actions"{
  description = "list of actions for bucket policy"
  type        = list(string)
  default     = []
}
variable "resources"{
  description = "list of resources for bucket policy"
  type        = list(string)
  default     = []

}