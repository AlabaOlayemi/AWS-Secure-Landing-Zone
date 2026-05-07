# GuardDuty detector — updated syntax for AWS provider v5
resource "aws_guardduty_detector" "main" {
  enable = true

  tags = {
    Name = "${var.project_name}-guardduty"
  }
}

# S3 protection as a separate resource (new way)
resource "aws_guardduty_detector_feature" "s3_logs" {
  detector_id = aws_guardduty_detector.main.id
  name        = "S3_DATA_EVENTS"
  status      = "ENABLED"
}

variable "project_name" {}