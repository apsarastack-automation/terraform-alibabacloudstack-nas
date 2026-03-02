# Get NAS zones and protocols data
data "alibabacloudstack_nas_zones" "default" {
}

data "alibabacloudstack_nas_file_systems" "default" {
  ids = [coalesce(var.nas_file_system_id, "fake_id")]
}



resource "terraform_data" "filesystem_exists" {
  input = length(data.alibabacloudstack_nas_file_systems.default.ids) > 0 ? 0 : 1
  lifecycle {
    ignore_changes = [ input ]
  }
}

# Create NAS file system (if not provided)
resource "alibabacloudstack_nas_file_system" "default" {
  count = terraform_data.filesystem_exists.input
  protocol_type    = var.protocol_type == "" ? data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.protocol_type : var.protocol_type
  storage_type     = var.storage_type == "" ? data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.storage_type : var.storage_type
  description      = var.description
  zone_id          = data.alibabacloudstack_nas_zones.default.zones.0.zone_id
  cluster_id       = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.cluster_id
}

# Use existing file system if ID is provided
locals {
  file_system_id = terraform_data.filesystem_exists.input == 0 ? data.alibabacloudstack_nas_file_systems.default.ids[0] : (
    length(alibabacloudstack_nas_file_system.default) > 0 ? alibabacloudstack_nas_file_system.default[0].id : ""
  )
}

# Create access group
resource "alibabacloudstack_nas_accessgroup" "default" {
  for_each          = { for mounts in var.mounts : mounts.access_group_name => mounts }
  access_group_name = each.value.access_group_name
  access_group_type = each.value.vswitch_id != "" ? "Vpc" : "Classic"
}

# Create mount target
resource "alibabacloudstack_nas_mounttarget" "default" {
  depends_on = [alibabacloudstack_nas_accessgroup.default]
  
  for_each          = { for mounts in var.mounts : mounts.access_group_name => mounts }
  file_system_id    = local.file_system_id
  vswitch_id        = each.value.vswitch_id
  access_group_name = each.value.access_group_name
}

# Create directory quota
resource "alibabacloudstack_nas_dir_quota" "default" {
  count          = var.quota_path != "" && length(var.quotas) > 0 ? 1 : 0
  file_system_id = local.file_system_id
  path           = var.quota_path

  dynamic "quotas" {
    for_each = var.quotas
    content {
      quota_type       = quotas.value.quota_type
      user_type        = quotas.value.user_type
      user_id          = quotas.value.user_id
      size_limit       = quotas.value.size_limit
      file_count_limit = quotas.value.file_count_limit
    }
  }
}