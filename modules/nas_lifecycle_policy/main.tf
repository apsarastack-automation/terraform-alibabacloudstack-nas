# Create lifecycle policy for NAS file system
resource "alibabacloudstack_nas_lifecycle_policy" "default" {
  file_system_id        = var.file_system_id
  lifecycle_policy_name = var.lifecycle_policy_name
  lifecycle_rule_name   = var.lifecycle_rule_name
  path                  = var.path
  oss_bucket            = var.oss_bucket
  recursive             = var.recursive
  storage_type          = var.storage_type
}
