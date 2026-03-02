output "file_system_id" {
  description = "The ID of the created file system"
  value       = module.nas_multiple_access_groups.file_system_id
}

output "file_system_description" {
  description = "The description of the file system"
  value       = module.nas_multiple_access_groups.file_system_description
}

output "protocol_type" {
  description = "The protocol type of the file system"
  value       = module.nas_multiple_access_groups.protocol_type
}

output "storage_type" {
  description = "The storage type of the file system"
  value       = module.nas_multiple_access_groups.storage_type
}