# AWS Secure Landing Zone [ Terraform ]

A production grade, security hardened AWS landing zone built
entirely with Terraform (Infrastructure as Code). This project
automates the secure foundation that companies build before
deploying any application or workload to the cloud.

---

## What this builds

| Component | Purpose | Security Value |
|---|---|---|
| S3 Logging Bucket | Stores all audit logs | Encrypted (AES-256), versioned, fully private |
| CloudTrail | Records every API action in the account | Tamper evident, multi region |
| GuardDuty | AWS native threat detection | Monitors for suspicious behaviour 24/7 |
| IAM Password Policy | Enforces strong passwords | 14 char min, MFA-ready, 90 day rotation |

---

## Architecture
aws-landing-zone/
├── providers.tf        ← AWS provider + region config
├── main.tf             ← Connects all modules together
├── variables.tf        ← Configurable settings
├── outputs.tf          ← Displays results after apply
└── modules/
    ├── iam/            ← Acc unt-wide password policy
    ├── s3/             ← Encrypted audit log bucket
    ├── cloudtrail/     ← Full API audit trail
    └── guardduty/      ← Threat detection

---

## Real world problems this solves

**No audit trail** : CloudTrail records every action so
  security teams know exactly who did what and when
**Undetected threats** : GuardDuty uses ML to flag
  suspicious behaviour that humans would miss
**Weak credentials** : IAM policy enforces strong passwords
  across the entire account automatically
**Exposed log data** : S3 bucket is locked down with
  encryption, versioning, and zero public access

---

## Errors encountered and resolved

### 1. Scanner User permission denied (403)
**Cause:** Terraform was running as scanner user which only
has SecurityAudit (read only) permissions.
**Fix:** Created a separate terraform user with
AdministratorAccess and configured a named AWS CLI profile.

### 2. CloudTrail InsufficientS3BucketPolicyException
**Cause:** CloudTrail requires explicit S3 bucket policy
permission to write logs  AWS does not grant this by default.
**Fix:** Added aws_s3_bucket_policy resource granting
CloudTrail PutObject and GetBucketAcl permissions.

### 3. GuardDuty BadRequestException  detector already exists
**Cause:** GuardDuty was manually enabled in the console
before Terraform ran, creating a conflict.
**Fix:** Used data "aws_guardduty_detector" "existing" {}
to reference the existing detector instead of creating a new
one, a standard IaC pattern for pre-existing infrastructure.

### 4. Deprecated datasources syntax warning
**Cause:** AWS provider v5 deprecated the datasources block
inside aws_guardduty_detector.
**Fix:** Replaced with aws_guardduty_detector_feature
resource blocks per updated AWS provider documentation.

---

## How to deploy

bash
# Configure AWS credentials
aws configure --profile terraform

# Initialise Terraform
terraform init

# Preview what will be built
terraform plan

# Deploy the landing zone
terraform apply

---

## Skills demonstrated

Terraform · HCL · Infrastructure as Code · AWS IAM ·
S3 Bucket Policies · CloudTrail · GuardDuty · AWS CLI ·
Cloud Security Architecture · IaC Debugging ·
Security Hardening · Least Privilege · Encryption at Rest

---

## Author

**Alaba Olayemi** — Cloud Security Engineer (in progress)
github.com/AlabaOlayemi
linkedin.com/in/alaba-olayemi
