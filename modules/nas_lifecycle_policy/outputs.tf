output "lifecycle_policy_id" {
  description = "The ID of the created lifecycle policy"
  value       = length(alibabacloudstack_nas_lifecycle_policy.default) > 0 ? alibabacloudstack_nas_lifecycle_policy.default[0].id : ""
}

output "create_time" {
  description = "The creation time of the lifecycle policy"
  value       = length(alibabacloudstack_nas_lifecycle_policy.default) > 0 ? alibabacloudstack_nas_lifecycle_policy.default[0].create_time : ""
}