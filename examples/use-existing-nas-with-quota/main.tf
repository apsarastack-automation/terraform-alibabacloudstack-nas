module "nas_example_2" {
  source = "../../modules/nas_file_system"
  description        = var.description
  nas_file_system_id = var.nas_file_system_id
  quota_path         = var.quota_path
  quotas             = var.quotas
}
