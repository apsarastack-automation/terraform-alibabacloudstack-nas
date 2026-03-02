data "alibabacloudstack_zones" "existing" {
  available_resource_creation = "VSwitch"
}

resource "alibabacloudstack_vpc_vpc" "existing" {
  count      = var.vsw_count
  cidr_block = "172.16.0.0/16"
  vpc_name   = "${var.name}-vpc-${count.index}"
}

resource "alibabacloudstack_vpc_vswitch" "existing" {
  count        = var.vsw_count
  vpc_id       = alibabacloudstack_vpc_vpc.existing[count.index].id
  cidr_block   = "172.16.0.0/16"
  zone_id      = data.alibabacloudstack_zones.existing.zones[0].id
  vswitch_name = "${var.name}-vswitch-${count.index}"
}

