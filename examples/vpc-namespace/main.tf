module "vpc_namespace" {
  source = "../../modules/nas_namespace"
  description = var.description
  accessgroups = var.accessgroups
}
