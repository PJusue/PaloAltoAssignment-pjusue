variable "report_name" {
  description = "Name of the Cost and Usage Report"
  type        = string
}

variable "time_unit" {
  description = "Time unit for report (HOURLY, DAILY, MONTHLY)"
  type        = string
  default     = "HOURLY"
}

variable "format" {
  description = "Format for report (Parquet, textORcsv)"
  type        = string
  default     = "Parquet"
}

variable "compression" {
  description = "Compression format for report"
  type        = string
  default     = "Parquet"
}

variable "additional_schema_elements" {
  description = "Schema elements to include in report"
  type        = list(string)
  default     = ["RESOURCES"]
}

variable "s3_bucket" {
  description = "S3 bucket where reports will be stored"
  type        = string
}

variable "s3_region" {
  description = "Region of the S3 bucket"
  type        = string
}

variable "additional_artifacts" {
  description = "Additional artifacts to include"
  type        = list(string)
  default     = [""]
}

variable "report_versioning" {
  description = "Report versioning strategy"
  type        = string
  default     = "OVERWRITE_REPORT"
}
variable "s3_prefix" {
  description = "The prefix for the report data in the S3 bucket"
  type        = string
}