# Get NAS zones data for auto-detection
data "alibabacloudstack_nas_zones" "default" {
}

data "alibabacloudstack_nas_namespaces" "default" {
  ids = [var.nas_namespace_id]
}

# Create or use existing NAS namespace
resource "alibabacloudstack_nas_namespace" "default" {
  count = length(data.alibabacloudstack_nas_namespaces.default.ids) > 0 ? 0 : 1
  
  zone_id       = data.alibabacloudstack_nas_zones.default.zones.0.zone_id
  cluster_id    = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.cluster_id
  description   = var.description
  storage_type  = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.storage_type
  protocol_type = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.protocol_type
  encrypt_type  = "0"
}

# Local value for namespace ID (existing or newly created)
locals {
  namespace_id = length(data.alibabacloudstack_nas_namespaces.default.ids) > 0 ? data.alibabacloudstack_nas_namespaces.default.ids.0: alibabacloudstack_nas_namespace.default.0.id
}

# Create NAS file systems based on filesystems parameter
resource "alibabacloudstack_nas_file_system" "filesystems" {
  for_each = { for filesystem in var.filesystems: filesystem=>filesystem }
  protocol_type    = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.protocol_type
  storage_type     = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.instance_types.0.storage_type
  description      = each.value
  zone_id          = data.alibabacloudstack_nas_zones.default.zones.0.zone_id
  cluster_id       = data.alibabacloudstack_nas_zones.default.zones.0.clusters.0.cluster_id
}

# Attach file systems to namespace (one-to-many binding)
resource "alibabacloudstack_nas_namespace_filesystem_attachment" "attachments" {
  for_each = { for filesystem in var.filesystems: filesystem=>filesystem }
  
  nas_namespace_id = local.namespace_id
  mapped_path      = alibabacloudstack_nas_file_system.filesystems[each.key].description
  file_system_id   = alibabacloudstack_nas_file_system.filesystems[each.key].id
}

# Create access groups based on accessgroups parameter
resource "alibabacloudstack_nas_accessgroup" "accessgroups" {
  for_each = { for accessgroup in var.accessgroups: accessgroup.access_group_name=>accessgroup }
  
  access_group_name = each.value.access_group_name
  access_group_type = each.value.vswitch_id != "" ? "Vpc" : "Classic"
}

# Create namespace mount targets for VPC access groups
resource "alibabacloudstack_nas_namespace_mount_target" "mount_targets" {
  depends_on = [ "alibabacloudstack_nas_accessgroup.accessgroups" ]
  for_each = { for accessgroup in var.accessgroups: accessgroup.access_group_name=>accessgroup }
  
  network_type      = each.value.vswitch_id != "" ? "Vpc" : "Classic"
  access_group_name = each.value.access_group_name
  nas_namespace_id  = local.namespace_id
  vswitch_id        = each.value.vswitch_id
}

# Bind access groups to namespace (one-to-many binding)
resource "alibabacloudstack_nas_namespace_group" "namespace_groups" {
  for_each = { for ag in var.accessgroups : ag.access_group_name => ag }

  network_type        = each.value.vswitch_id != "" ? "Vpc" : "Classic"
  mapped_path         = each.value.mapped_path
  nas_namespace_id    = local.namespace_id
  mount_target_domain = alibabacloudstack_nas_namespace_mount_target.mount_targets[each.key].mount_target_domain
}
