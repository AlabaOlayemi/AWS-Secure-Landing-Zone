# Step 1 — build the secure S3 logging bucket first
module "s3" {
  source       = "./modules/s3"
  project_name = var.project_name
}

# Step 2 — enforce IAM password policy
module "iam" {
  source = "./modules/iam"
}

# Step 3 — turn on CloudTrail, save logs to our bucket
module "cloudtrail" {
  source        = "./modules/cloudtrail"
  project_name  = var.project_name
  log_bucket_id = module.s3.bucket_id  # passes bucket name from s3 module
}

# Step 4 — enable GuardDuty threat detection
module "guardduty" {
  source       = "./modules/guardduty"
  project_name = var.project_name
}