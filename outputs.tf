output "nas_namespace_id" {
  description = "The ID of the NAS namespace"
  value       = module.nas_namespace.nas_namespace_id
}

output "filesystem_ids" {
  description = "List of created filesystem IDs"
  value       = module.nas_namespace.filesystem_ids
}

output "access_group_ids" {
  description = "List of created access group IDs"
  value       = module.nas_namespace.access_group_ids
}

output "mount_target_domains" {
  description = "List of mount target domains for VPC access groups"
  value       = module.nas_namespace.mount_target_domains
}

output "namespace_group_ids" {
  description = "List of namespace group IDs"
  value       = module.nas_namespace.namespace_group_ids
}
