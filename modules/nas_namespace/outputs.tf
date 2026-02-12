output "nas_namespace_id" {
  description = "The ID of the NAS namespace"
  value       = local.namespace_id
}

output "filesystem_ids" {
  description = "List of created filesystem IDs"
  value       = alibabacloudstack_nas_file_system.filesystems[*].id
}

output "access_group_ids" {
  description = "List of created access group IDs"
  value       = alibabacloudstack_nas_accessgroup.accessgroups[*].id
}

output "mount_target_domains" {
  description = "List of mount target domains for VPC access groups"
  value       = alibabacloudstack_nas_namespace_mount_target.mount_targets[*].mount_target_domain
}

output "namespace_group_ids" {
  description = "List of namespace group IDs"
  value       = alibabacloudstack_nas_namespace_group.namespace_groups[*].id
}

output "lifecycle_policy_id" {
  description = "The ID of the lifecycle policy (if created)"
  value       = length(alibabacloudstack_nas_lifecycle_policy.lifecycle) > 0 ? alibabacloudstack_nas_lifecycle_policy.lifecycle[0].id : null
}

output "filesystem_attachments" {
  description = "List of filesystem attachment IDs"
  value       = alibabacloudstack_nas_namespace_filesystem_attachment.attachments[*].id
}