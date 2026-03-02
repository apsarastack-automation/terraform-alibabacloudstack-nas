output "lifecycle_policy_id" {
  description = "The ID of the created lifecycle policy"
  value       = module.lifecycle_policy.lifecycle_policy_id
}

output "lifecycle_policy_create_time" {
  description = "The creation time of the lifecycle policy"
  value       = module.lifecycle_policy.create_time
}