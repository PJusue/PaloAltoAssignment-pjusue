resource "aws_kms_key" "key" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_key_policy" "policy" {
  key_id = aws_kms_key.key.id
  policy = var.policy
}
