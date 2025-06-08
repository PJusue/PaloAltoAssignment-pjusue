resource "aws_cur_report_definition" "this" {
  report_name                = var.report_name
  time_unit                  = var.time_unit
  format                     = var.format
  compression                = var.compression
  additional_schema_elements = var.additional_schema_elements
  s3_bucket                  = var.s3_bucket
  s3_region                  = var.s3_region
  additional_artifacts       = var.additional_artifacts
  s3_prefix                  = var.s3_prefix
  report_versioning          = var.report_versioning
}