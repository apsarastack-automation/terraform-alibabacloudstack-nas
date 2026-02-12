output "nas_namespace_id" {
  description = "The ID of the NAS namespace"
  value       = local.namespace_id
}

output "filesystem_ids" {
  description = "List of created filesystem IDs"
  value       = [for fs in alibabacloudstack_nas_file_system.filesystems : fs.id]
}

output "access_group_ids" {
  description = "List of created access group IDs"
  value       = [for ag in alibabacloudstack_nas_accessgroup.accessgroups : ag.id]
}

output "mount_target_domains" {
  description = "List of mount target domains for VPC access groups"
  value       = [for mt in alibabacloudstack_nas_namespace_mount_target.mount_targets : mt.mount_target_domain]
}

output "namespace_group_ids" {
  description = "List of namespace group IDs"
  value       = [for ng in alibabacloudstack_nas_namespace_group.namespace_groups : ng.id]
}