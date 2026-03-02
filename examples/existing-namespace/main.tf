module "existing_namespace" {
  source = "../../modules/nas_namespace"

  description      = var.description
  nas_namespace_id = var.nas_namespace_id
  filesystems      = var.filesystems
  accessgroups     = var.accessgroups
}
