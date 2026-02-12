data "alibabacloudstack_nas_zones" "existing" {
}

resource "alibabacloudstack_nas_file_system" "existing" {
  protocol_type = data.alibabacloudstack_nas_zones.existing.zones.0.clusters.0.instance_types.0.protocol_type
  storage_type  = data.alibabacloudstack_nas_zones.existing.zones.0.clusters.0.instance_types.0.storage_type
  zone_id       = data.alibabacloudstack_nas_zones.existing.zones.0.zone_id
  cluster_id    = data.alibabacloudstack_nas_zones.existing.zones.0.clusters.0.cluster_id
  description   = "${var.name}-test"
}

# Create OSS bucket for lifecycle policy
resource "alibabacloudstack_oss_bucket" "lifecycle_bucket" {
  bucket = "${var.name}-lifecycle-bucket"
  acl    = "private"
}

# Apply lifecycle policy to the first filesystem
module "lifecycle_policy" {
  source = "../../modules/nas_lifecycle_policy"
  
  file_system_id        = alibabacloudstack_nas_file_system.existing.id
  lifecycle_policy_name = var.name
  lifecycle_rule_name   = "DEFAULT_ATIME_30"
  path                  = "/"
  oss_bucket            = alibabacloudstack_oss_bucket.lifecycle_bucket.id
  recursive             = true
}