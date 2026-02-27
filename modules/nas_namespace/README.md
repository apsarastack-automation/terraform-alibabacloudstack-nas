Terraform module which creates NAS (Network Attached Storage) namespace on Alibaba Cloud Stack

terraform-alibabacloudstack-nas-namespace
---

This module is used to create a NAS (Network Attached Storage) namespace with file systems, access groups, mount targets, and namespace groups on Alibaba Cloud Stack.

These types of resources are supported:

* [alibabacloudstack_nas_namespace](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace)
* [alibabacloudstack_nas_file_system](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_file_system)
* [alibabacloudstack_nas_namespace_filesystem_attachment](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace_filesystem_attachment)
* [alibabacloudstack_nas_accessgroup](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_accessgroup)
* [alibabacloudstack_nas_namespace_mount_target](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace_mount_target)
* [alibabacloudstack_nas_namespace_group](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace_group)

## Usage

```hcl
module "nas_namespace" {
  source = "terraform-alibabacloudstack-modules/nas-namespace/alibabacloudstack"

  description = "My NAS namespace"
  
  # File systems to create and attach
  filesystems = ["fs1", "fs2"]
  
  # Access groups configuration
  accessgroups = [
    {
      access_group_name = "my-access-group"
      mapped_path       = "/data"
      vswitch_id        = "vsw-xxx"
    }
  ]
}
```

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 3.18 |
| <a name="requirement_alibabacloudstack"></a> [alibabacloudstack](#requirement\_alibabacloudstack) | >= 3.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alibabacloudstack"></a> [alibabacloudstack](#provider\_alibabacloudstack) | >= 3.18 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| description | Description for the NAS namespace | `string` | `"Managed by Terraform"` | no |
| nas_namespace_id | Existing NAS namespace ID. If provided, will use existing namespace instead of creating new one | `string` | `""` | no |
| filesystems | List of filesystem configurations to create and attach to namespace | `list(string)` | `[]` | no |
| accessgroups | List of access group configurations | `list(object)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| nas_namespace_id | The ID of the NAS namespace |
| filesystem_ids | List of created filesystem IDs |
| access_group_ids | List of created access group IDs |
| mount_target_domains | List of mount target domains for VPC access groups |
| namespace_group_ids | List of namespace group IDs |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alibabacloudstack/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alibabacloudstack Github](https://github.com/aliyun/terraform-provider-alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack Release](https://registry.terraform.io/providers/aliyun/alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack Docs](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs)
