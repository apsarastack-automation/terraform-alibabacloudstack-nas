
module "basic_namespace" {
  source      = "../../modules/nas_namespace"
  description = var.description
  filesystems = var.filesystems
}
