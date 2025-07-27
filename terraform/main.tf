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

resource "aws_s3_bucket_policy" "backup_policy" {
  bucket = aws_s3_bucket.backup_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowReadWriteAccess",
        Effect    = "Allow",
        Principal = "*",  # Consider using IAM user or role ARN
        Action    = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource = "${aws_s3_bucket.backup_bucket.arn}/*"
      }
    ]
  })
}

