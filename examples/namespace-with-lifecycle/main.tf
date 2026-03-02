module "lifecycle_policy" {
  source = "../../modules/nas_lifecycle_policy"
  
  file_system_id        = var.file_system_id
  lifecycle_policy_name = var.name
  lifecycle_rule_name   = var.lifecycle_rule_name
  path                  = var.path
  oss_bucket            = var.lifecycle_bucket
  recursive             = var.recursive
}