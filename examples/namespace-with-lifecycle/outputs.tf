output "file_system_id" {
  description = "The ID of the created file system"
  value       = alibabacloudstack_nas_file_system.existing.id
}

output "file_system_description" {
  description = "The description of the file system"
  value       = alibabacloudstack_nas_file_system.existing.description
}

output "oss_bucket_id" {
  description = "The ID of the created OSS bucket"
  value       = alibabacloudstack_oss_bucket.lifecycle_bucket.id
}

output "lifecycle_policy_id" {
  description = "The ID of the created lifecycle policy"
  value       = module.lifecycle_policy.lifecycle_policy_id
}

output "lifecycle_policy_create_time" {
  description = "The creation time of the lifecycle policy"
  value       = module.lifecycle_policy.create_time
}