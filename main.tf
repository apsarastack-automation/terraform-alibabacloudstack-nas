module "nas_namespace" {
  source = "./modules/nas_namespace"
  
  name                   = var.name
  description            = var.description
  nas_namespace_id       = var.nas_namespace_id
  filesystems            = var.filesystems
  accessgroups           = var.accessgroups
  lifecycle_policy_name  = var.lifecycle_policy_name
  lifecycle_rule_name    = var.lifecycle_rule_name
  path                   = var.path
  oss_bucket             = var.oss_bucket
  recursive              = var.recursive
}