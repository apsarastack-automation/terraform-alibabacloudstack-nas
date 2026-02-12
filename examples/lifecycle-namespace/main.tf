variable "name" {
  default = "tf-example-lifecycle-namespace"
}

provider "alibabacloudstack" {
  region = "cn-hangzhou"
}

resource "alibabacloudstack_oss_bucket" "default" {
  bucket = "${var.name}-bucket"
  acl    = "private"
}

module "lifecycle_namespace" {
  source = "../.."
  
  name        = var.name
  description = "NAS namespace with lifecycle policy"
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Capacity"
      description   = "${var.name}-filesystem"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "${var.name}-access-group"
      access_group_type = "Classic"
    }
  ]
  
  # Lifecycle policy configuration
  lifecycle_policy_name = "${var.name}-lifecycle-policy"
  lifecycle_rule_name   = "DEFAULT_ATIME_30"
  path                  = "/"
  oss_bucket            = alibabacloudstack_oss_bucket.default.id
  recursive             = true
}