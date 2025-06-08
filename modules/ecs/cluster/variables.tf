variable "cluster_name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
}

variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "configuration" {
  description = "Execute command configuration for the cluster"
  type = object({
    execute_command_configuration = optional(object({
      kms_key_id = optional(string)
      log_configuration = optional(object({
        cloud_watch_encryption_enabled = optional(bool)
        cloud_watch_log_group_name     = optional(string)
        s3_bucket_name                 = optional(string)
        s3_bucket_encryption_enabled   = optional(bool)
        s3_key_prefix                  = optional(string)
      }))
      logging = optional(string)
    }))
    managed_storage_configuration = optional(object({
      fargate_ephemeral_storage_kms_key_id = optional(string)
      kms_key_id                           = optional(string)
    }))
  })
  default = null
}

variable "service_connect_defaults" {
  description = "Default Service Connect namespace"
  type = object({
    namespace = string
  })
  default = null
}

variable "settings" {
  description = "Configuration block(s) with cluster settings"
  type = list(object({
    name  = string
    value = string
  }))
  default = []

  validation {
    condition     = alltrue([for setting in var.settings : contains(["containerInsights"], setting.name)])
    error_message = "Setting name must be 'containerInsights'"
  }

  validation {
    condition     = alltrue([for setting in var.settings : contains(["enhanced", "enabled", "disabled"], setting.value)])
    error_message = "Setting value must be one of: enhanced, enabled, disabled"
  }
}

variable "tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = null
}

variable "kms_key_id" {
  description = "KMS key ID for Fargate ephemeral storage encryption"
  type        = string
}
