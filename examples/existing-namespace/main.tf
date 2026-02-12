data "alibabacloudstack_nas_zones" "existing" {
}



# Create or use existing NAS namespace
resource "alibabacloudstack_nas_namespace" "existing" {
  zone_id       = data.alibabacloudstack_nas_zones.existing.zones.0.zone_id
  cluster_id    = data.alibabacloudstack_nas_zones.existing.zones.0.clusters.0.cluster_id
  description   = var.description
  storage_type  = data.alibabacloudstack_nas_zones.existing.zones.0.clusters.0.instance_types.0.storage_type
  protocol_type = data.alibabacloudstack_nas_zones.existing.zones.0.clusters.0.instance_types.0.protocol_type
  encrypt_type  = "0"
}


module "existing_namespace" {
  source = "../.."
  
  description      = var.description
  nas_namespace_id = alibabacloudstack_nas_namespace.existing.id
  
  filesystems = var.filesystems
  
  accessgroups = [
    {
      access_group_name = "tf-access-group1"
      vswitch_id        = ""
      mapped_path       = "/test1"
    },
    {
      access_group_name = "tf-access-group2"
      vswitch_id        = ""
      mapped_path       = "/test2"
    }
  ]
}