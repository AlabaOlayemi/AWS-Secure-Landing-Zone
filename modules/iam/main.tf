# IAM Password Policy — forces strong passwords for every user
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 14     # at least 14 characters
  require_uppercase_characters   = true   # must have A-Z
  require_lowercase_characters   = true   # must have a-z
  require_numbers                = true   # must have 0-9
  require_symbols                = true   # must have !@#$
  allow_users_to_change_password = true   # users can change their own
  max_password_age               = 90     # must change every 90 days
  password_reuse_prevention      = 12     # can't reuse last 12 passwords
}