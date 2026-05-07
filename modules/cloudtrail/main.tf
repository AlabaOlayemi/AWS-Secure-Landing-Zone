resource "aws_cloudtrail" "main" {
  name                          = "${var.project_name}-trail"
  s3_bucket_name                = var.log_bucket_id  # save logs to our secure bucket
  include_global_service_events = true  # log IAM and global events too
  is_multi_region_trail         = true  # watch ALL regions, not just one
  enable_log_file_validation    = true  # detects if logs are tampered with

  tags = {
    Name    = "${var.project_name}-cloudtrail"
    Purpose = "Security audit logging"
  }
}

variable "project_name" {}
variable "log_bucket_id" {}