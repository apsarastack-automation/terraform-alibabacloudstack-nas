output "bucket_name" {
  description = "The ID list of the created vpc vswitchs."
  value       = alibabacloudstack_oss_bucket.lifecycle_bucket.bucket
}
