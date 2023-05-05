resource "aws_s3_bucket" "code_deploy_backend_bucket" {
  bucket        = "${local.prefix}-app"
  force_destroy = true

  tags = local.common_tags
}

# took out acl and added this instead
resource "aws_s3_bucket_policy" "code_deploy_bucket_policy" {
  bucket = aws_s3_bucket.code_deploy_backend_bucket.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Sid": "AllowS3GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "${aws_s3_bucket.code_deploy_backend_bucket.arn}/*"
    }]
  })
}


resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.code_deploy_backend_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_versioning" "code_deploy_bucket_versioning" {
  bucket = aws_s3_bucket.code_deploy_backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
