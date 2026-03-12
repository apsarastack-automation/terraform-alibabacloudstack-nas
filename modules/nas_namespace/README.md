# Terraform Module for Creating NAS (Network Attached Storage) Namespaces on Alibaba Cloud Stack

terraform-alibabacloudstack-nas-namespace
---

This module is used to create NAS (Network Attached Storage) namespaces on Alibaba Cloud Stack, including file systems, access groups, mount targets, and namespace groups.

It supports the following resource types:

* alibabacloudstack_nas_namespace
* alibabacloudstack_nas_file_system
* alibabacloudstack_nas_namespace_filesystem_attachment
* alibabacloudstack_nas_accessgroup
* alibabacloudstack_nas_namespace_mount_target
* alibabacloudstack_nas_namespace_group

## Usage

```hcl
module "nas_namespace" {
  source = "terraform-alibabacloudstack-modules/nas-namespace/alibabacloudstack"

  description = "My NAS namespace"
  
  # File systems to be created and attached
  filesystems = ["fs1", "fs2"]
  
  # Access group configuration
  accessgroups = [
    {
      access_group_name = "my-access-group"
      mapped_path       = "/data"
      vswitch_id        = "vsw-xxx"
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
| description | Description of the NAS namespace | `string` | `"Managed by Terraform"` | no |
| nas_namespace_id | ID of an existing NAS namespace. If provided, the existing namespace will be used instead of creating a new one | `string` | `""` | no |
| filesystems | List of file system configurations to be created and attached to the namespace | `list(string)` | `[]` | no |
| accessgroups | List of access group configurations | `list(object)` | `[]` | no |

## Outputs

| Name | Description |
|------|------|
| nas_namespace_id | The ID of the NAS namespace |
| filesystem_ids | List of IDs of the created file systems |
| access_group_ids | List of IDs of the created access groups |
| mount_target_domains | List of mount target domain names for VPC access groups |
| namespace_group_ids | List of namespace group IDs |

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