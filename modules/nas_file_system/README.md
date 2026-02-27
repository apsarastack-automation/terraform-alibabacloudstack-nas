Terraform module which creates NAS (Network Attached Storage) file system on Alibaba Cloud Stack

terraform-alibabacloudstack-nas-file-system
---

This module is used to create a NAS (Network Attached Storage) file system with access groups, mount targets, and directory quotas on Alibaba Cloud Stack.

These types of resources are supported:

* [alibabacloudstack_nas_file_system](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_file_system)
* [alibabacloudstack_nas_accessgroup](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_accessgroup)
* [alibabacloudstack_nas_mounttarget](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_mounttarget)
* [alibabacloudstack_nas_dir_quota](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_dir_quota)

## Usage

```hcl
module "nas_file_system" {
  source = "terraform-alibabacloudstack-modules/nas-file-system/alibabacloudstack"

  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "My NAS file system"
  
  # Mount targets configuration
  mounts = [
    {
      access_group_name = "my-access-group"
      vswitch_id        = "vsw-xxx"
    }
  ]
  
  # Directory quota (optional)
  quota_path = "/data"
  quotas = [
    {
      quota_type       = "User"
      user_type        = "LocalUser"
      user_id          = "0"
      size_limit       = 1073741824
      file_count_limit = 10000
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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_alibabacloudstack"></a> [alibabacloudstack](#requirement\_alibabacloudstack) | >= 3.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alibabacloudstack"></a> [alibabacloudstack](#provider\_alibabacloudstack) | >= 3.18 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| protocol_type | File transfer protocol type | `string` | `""` | no |
| storage_type | The storage type | `string` | `""` | no |
| description | File system description | `string` | n/a | yes |
| mounts | A list of access group configurations | `list(object)` | `[]` | no |
| quota_path | Whether to enable directory quota | `string` | `"/"` | no |
| quotas | A list of quota configurations | `list(object)` | `[]` | no |
| nas_file_system_id | Existing file system ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| file_system_id | The ID of the created file system |
| file_system_description | The description of the file system |
| quota_status | The status of directory quota |
| protocol_type | The protocol type of the file system |
| storage_type | The storage type of the file system |

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