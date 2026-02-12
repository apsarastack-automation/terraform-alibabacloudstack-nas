variable "test_name" {
  default = "tf-test-nas-namespace"
}

provider "alibabacloudstack" {
  region = "cn-hangzhou"
}

module "test_namespace" {
  source = "../"
  
  name        = var.test_name
  description = "Test NAS namespace creation"
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Capacity"
      description   = "${var.test_name}-test-fs"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "${var.test_name}-test-ag"
      access_group_type = "Classic"
    }
  ]
}

# Test assertions
output "test_namespace_id" {
  value = module.test_namespace.nas_namespace_id
}

output "test_filesystem_count" {
  value = length(module.test_namespace.filesystem_ids)
}

output "test_accessgroup_count" {
  value = length(module.test_namespace.access_group_ids)
}