data "alibabacloudstack_zones" "existing" {
  available_resource_creation = "VSwitch"
}

resource "alibabacloudstack_vpc_vpc" "existing" {
  count      = 2
  cidr_block = "172.16.0.0/16"
  vpc_name   = "${var.description}-vpc-${count.index}"
}

resource "alibabacloudstack_vpc_vswitch" "existing" {
  count        = 2
  vpc_id       = alibabacloudstack_vpc_vpc.existing[count.index].id
  cidr_block   = "172.16.0.0/16"
  zone_id      = data.alibabacloudstack_zones.existing.zones[0].id
  vswitch_name = "${var.description}-vswitch-${count.index}"
}

module "vpc_namespace" {
  source = "../.."

  description = var.description

  accessgroups = [
    {
      access_group_name = "tf-access-group1"
      vswitch_id        = alibabacloudstack_vpc_vswitch.existing[0].id
      mapped_path       = "/test1"
    },
    {
      access_group_name = "tf-access-group2"
      vswitch_id        = alibabacloudstack_vpc_vswitch.existing[1].id
      mapped_path       = "/test2"
    }
  ]
}
