resource "aws_sns_topic" "this" {
  name              = var.name
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  tags              = var.tags
}

resource "aws_sns_topic_subscription" "this" {
  count     = length(var.subscriptions)
  topic_arn = aws_sns_topic.this.arn
  protocol  = var.subscriptions[count.index].protocol
  endpoint  = var.subscriptions[count.index].endpoint
}
