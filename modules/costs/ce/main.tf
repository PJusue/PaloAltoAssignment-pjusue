resource "aws_ce_cost_category" "this" {
  name         = var.name
  rule_version = var.rule_version

  rule {
    value = var.rule_value
    type = "REGULAR"
    rule {
      tags {
        key    = var.tag_key
        values = var.tag_values
      }
    }
  }
}