output "vpc_vswitchs" {
  description = "The ID list of the created vpc vswitchs."
  value       = alibabacloudstack_vpc_vswitch.existing.*.id
}
