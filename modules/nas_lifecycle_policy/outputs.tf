output "lifecycle_policy_id" {
  description = "The ID of the created lifecycle policy"
  value       = alibabacloudstack_nas_lifecycle_policy.default.id
}

output "create_time" {
  description = "The creation time of the lifecycle policy"
  value       = alibabacloudstack_nas_lifecycle_policy.default.create_time
}