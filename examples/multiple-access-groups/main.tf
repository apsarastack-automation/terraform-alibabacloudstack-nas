data "alibabacloudstack_zones" "existing" {
  available_resource_creation = "VSwitch"
}

resource "alibabacloudstack_vpc_vpc" "existing" {
  count      = 3
  cidr_block = "172.16.0.0/16"
  vpc_name   = "${var.description}-vpc-${count.index}"
}

resource "alibabacloudstack_vpc_vswitch" "existing" {
  count        = 3
  vpc_id       = alibabacloudstack_vpc_vpc.existing[count.index].id
  cidr_block   = "172.16.0.0/16"
  zone_id      = data.alibabacloudstack_zones.existing.zones[0].id
  vswitch_name = "${var.description}-vswitch-${count.index}"
}


module "nas_multiple_access_groups" {
  source      = "../../modules/nas_file_system"
  description = var.description
  mounts = [
    {
      access_group_name = "${var.description}1"
      vswitch_id        = alibabacloudstack_vpc_vswitch.existing[0].id
    },
    {
      access_group_name = "${var.description}2"
      vswitch_id        = alibabacloudstack_vpc_vswitch.existing[1].id
    },
    {
      access_group_name = "${var.description}3"
      vswitch_id        = alibabacloudstack_vpc_vswitch.existing[2].id
    },
  ]
}
