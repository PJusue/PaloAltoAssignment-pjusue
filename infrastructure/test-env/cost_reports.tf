provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
  profile = "billing"
}
module "cur-s3-bucket" {
  source      = "../../modules/s3"
  bucket_name = "cur-ecs-palo-alto-poc"
  type = "Service"
  identifiers = ["billingreports.amazonaws.com"]
  actions = ["*"]
}
module "ecs-cost-report" {
  source = "../../modules/costs/cur"

  report_name = "ecs-cost-report"
  s3_bucket   = module.cur-s3-bucket.bucket_id
  s3_region   = "us-west-2"
  s3_prefix   = "cost-report"

  additional_schema_elements = ["RESOURCES"]
  additional_artifacts       = ["ATHENA"]
  time_unit                  = "HOURLY"
  format                     = "Parquet"
  compression                = "Parquet"
  report_versioning          = "OVERWRITE_REPORT"
}
module "ecs-cost-category" {
  source = "../../modules/costs/ce"

  name       = "ECS Costs"
  rule_value = "ECS Costs"
  tag_key    = "Project"
  tag_values = ["ECS-PaloAlto"]
}

module "ecs-budget" {
  source = "../../modules/costs/budgets"

  name              = "ecs-monthly-budget"
  limit_amount      = "1000"
  time_period_start = "2023-01-01_00:00"

  cost_filter_name   = "TagKeyValue"
  cost_filter_values = ["user:Project$ECS-PaloAlto"]

  subscriber_email_addresses = ["test@test-paloalto.com"]
}