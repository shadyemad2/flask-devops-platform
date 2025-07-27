#!/bin/bash
set -e
set -o pipefail

# Load environment variables from .env
if [ -f .env ]; then
  set -a
  source .env
  set +a
else
  echo "[ERROR] .env file not found."
  exit 1
fi

: "${AWS_ACCESS_KEY_ID:?Not set}"
: "${AWS_SECRET_ACCESS_KEY:?Not set}"
: "${AWS_SESSION_TOKEN:?Not set}"

BUCKET_NAME="shady-backup-bucket-123456"
OBJECT_KEY="backup.json"
LOCAL_FILE="restored_backup.json"

echo "[INFO] Restoring from S3 bucket..."

if aws s3 cp "s3://${BUCKET_NAME}/${OBJECT_KEY}" "${LOCAL_FILE}"; then
  echo "[SUCCESS] Backup restored to ${LOCAL_FILE}"
else
  echo "[ERROR] Failed to restore backup from S3"
  exit 1
fi

