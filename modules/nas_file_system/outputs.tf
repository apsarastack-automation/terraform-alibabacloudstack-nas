output "file_system_id" {
  description = "The ID of the created file system"
  value       = local.file_system_id
}

output "file_system_description" {
  description = "The description of the file system"
  value = var.nas_file_system_id == null ? alibabacloudstack_nas_file_system.default[0].description : "Using existing file system"
}


output "quota_status" {
  description = "The status of directory quota"
  value       = var.quota_path != "" && length(var.quotas) > 0 ? alibabacloudstack_nas_dir_quota.default[0].status : null
}


output "protocol_type" {
  description = "The protocol type of the file system"
  value       = var.protocol_type
}

output "storage_type" {
  description = "The storage type of the file system"
  value       = var.storage_type
}