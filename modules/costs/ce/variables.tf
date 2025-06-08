variable "name" {
  description = "Name of the cost category"
  type        = string
}

variable "rule_version" {
  description = "Version of the cost category rule"
  type        = string
  default     = "CostCategoryExpression.v1"
}

variable "rule_value" {
  description = "Value for the cost category rule"
  type        = string
}

variable "tag_key" {
  description = "Key of the tag to filter costs"
  type        = string
}

variable "tag_values" {
  description = "Values of the tag to filter costs"
  type        = list(string)
}