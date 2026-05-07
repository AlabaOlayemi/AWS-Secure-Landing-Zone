variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ca-central-1"  # Canada — change if you want
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "alaba-landing-zone"
}

variable "alert_email" {
  description = "Email to receive security alerts"
  type        = string
  default     = "Olayemialabisco@gmail.com"
}