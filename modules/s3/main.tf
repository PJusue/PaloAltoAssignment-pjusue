resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags
}



resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "this" {
  statement {
    principals {
      type        = var.type
      identifiers = var.identifiers
    }
    actions = var.actions
    resources = length(var.resources) >0 ? var.resources : [aws_s3_bucket.this.arn,"${aws_s3_bucket.this.arn}/*"]
  }
  depends_on = [
    aws_s3_bucket.this
  ]
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
  depends_on = [
    aws_s3_bucket.this,
    data.aws_iam_policy_document.this
  ]
}