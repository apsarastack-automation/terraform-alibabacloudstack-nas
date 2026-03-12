# Terraform Module for Creating NAS (Network Attached Storage) File Systems on Alibaba Cloud Stack

terraform-alibabacloudstack-nas-file-system
---

This module is used to create NAS (Network Attached Storage) file systems on Alibaba Cloud Stack, including access groups, mount targets, and directory quotas.

It supports the following resource types:

* alibabacloudstack_nas_file_system
* alibabacloudstack_nas_accessgroup
* alibabacloudstack_nas_mounttarget
* alibabacloudstack_nas_dir_quota

## Usage

```hcl
module "nas_file_system" {
  source = "terraform-alibabacloudstack-modules/nas-file-system/alibabacloudstack"

  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "My NAS file system"
  
  # Mount target configuration
  mounts = [
    {
      access_group_name = "my-access-group"
      vswitch_id        = "vsw-xxx"
    }
  ]
  
  # Directory quotas (optional)
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

## Requirements

| Name | Version |
|------|------|
| terraform | >= 1.5.6 |

## Providers

| Name | Version |
|------|------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|------|------|--------|------|
| protocol_type | The file transfer protocol type | `string` | `""` | no |
| storage_type | The storage type | `string` | `""` | no |
| description | The description of the file system | `string` | n/a | yes |
| mounts | List of access group configurations | `list(object)` | `[]` | no |
| quota_path | The path for enabling directory quotas | `string` | `"/"` | no |
| quotas | List of quota configurations | `list(object)` | `[]` | no |
| nas_file_system_id | ID of an existing file system | `string` | `""` | no |

## Outputs

| Name | Description |
|------|------|
| file_system_id | The ID of the created file system |
| file_system_description | The description of the file system |
| quota_status | The status of the directory quota |
| protocol_type | The protocol type of the file system |
| storage_type | The storage type of the file system |

## Reporting Issues

If you encounter any issues while using this module, please submit a [provider issue](https://github.com/aliyun/terraform-provider-alibabacloudstack/issues/new) and let us know.

## Authors

Created and maintained by the Alibaba Cloud Terraform Team.

## License

MIT License. See LICENSE for details.

## References

* [Terraform-Provider-Alibabacloudstack Github](https://github.com/aliyun/terraform-provider-alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack Release](https://registry.terraform.io/providers/aliyun/alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack Documentation](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs)