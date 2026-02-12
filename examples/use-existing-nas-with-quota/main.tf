data "alibabacloudstack_nas_zones" "default" {
}

resource "alibabacloudstack_nas_file_system" "default" {
  protocol_type = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.protocol_type
  storage_type  = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.storage_type
  zone_id       = data.alibabacloudstack_nas_zones.default.zones.0.zone_id
  cluster_id    = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.cluster_id
  description   = var.description
}
# Example 2: Use existing file system with quota settings
module "nas_example_2" {
  source = "../../modules/nas_file_system"

  description        = var.description
  nas_file_system_id = alibabacloudstack_nas_file_system.default.id
  quota_path         = "/"
  quotas = var.quotas
}
