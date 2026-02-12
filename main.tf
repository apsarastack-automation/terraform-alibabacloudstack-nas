module "nas_module" {
  source = "./modules/nas_file_system"
  
  # File system parameters
  protocol_type     = var.protocol_type
  storage_type      = var.storage_type
  description       = var.description
  
  # Mount target parameters
  mounts            = var.mounts
  
  # Quota parameters
  quota_path        = var.quota_path
  quotas            = var.quotas
  
  # Existing file system
  nas_file_system_id = var.nas_file_system_id
}