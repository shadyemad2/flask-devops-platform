resource "aws_s3_bucket" "backup_bucket" {
  bucket = "shady-backup-bucket-123456"  # Must be globally unique
  acl    = "private"

  tags = {
    Name        = "BackupBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "backup_versioning" {
  bucket = aws_s3_bucket.backup_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Block Public Access = false to allow applying the policy
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.backup_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "backup_policy" {
  bucket = aws_s3_bucket.backup_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowReadWriteAccess",
        Effect    = "Allow",
        Principal = "*",  # Consider using specific IAM role/user for tighter security
        Action    = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource = "${aws_s3_bucket.backup_bucket.arn}/*"
      }
    ]
  })
}

