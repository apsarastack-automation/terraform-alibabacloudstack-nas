output "file_system_id" {
  description = "The ID of the created file system"
  value       = alibabacloudstack_nas_file_system.default.id
}

output "file_system_description" {
  description = "The description of the file system"
  value       = alibabacloudstack_nas_file_system.default.description
}

output "module_file_system_id" {
  description = "The ID of the file system from the module"
  value       = module.nas_example_2.file_system_id
}

output "quota_status" {
  description = "The status of directory quota"
  value       = module.nas_example_2.quota_status
}

output "protocol_type" {
  description = "The protocol type of the file system"
  value       = module.nas_example_2.protocol_type
}

output "storage_type" {
  description = "The storage type of the file system"
  value       = module.nas_example_2.storage_type
}