output "file_system_id" {
  description = "The ID of the created file system"
  value       = module.nas_module.file_system_id
}

output "file_system_description" {
  description = "The description of the file system"
  value       = module.nas_module.file_system_description
}

output "mount_target_domain" {
  description = "The domain of the mount target"
  value       = module.nas_module.mount_target_domain
}

output "access_group_name" {
  description = "The name of the access group"
  value       = module.nas_module.access_group_name
}

output "access_groups_created" {
  description = "List of created access groups"
  value       = module.nas_module.access_groups_created
}

output "quota_status" {
  description = "The status of directory quota"
  value       = module.nas_module.quota_status
}

output "file_system_type" {
  description = "The type of the file system"
  value       = module.nas_module.file_system_type
}

output "protocol_type" {
  description = "The protocol type of the file system"
  value       = module.nas_module.protocol_type
}

output "storage_type" {
  description = "The storage type of the file system"
  value       = module.nas_module.storage_type
}

output "zone_id" {
  description = "The zone ID of the file system"
  value       = module.nas_module.zone_id
}