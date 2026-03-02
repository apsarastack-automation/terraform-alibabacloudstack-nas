module "nas_multiple_access_groups" {
  source      = "../../modules/nas_file_system"
  description = var.description
  mounts = var.mounts
}
