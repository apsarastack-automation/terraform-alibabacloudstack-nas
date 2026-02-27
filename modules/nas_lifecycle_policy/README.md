Terraform module which creates NAS (Network Attached Storage) lifecycle policy on Alibaba Cloud Stack

terraform-alibabacloudstack-nas-lifecycle-policy
---

This module is used to create a NAS (Network Attached Storage) lifecycle policy for automatic data lifecycle management on Alibaba Cloud Stack.

These types of resources are supported:

* [alibabacloudstack_nas_lifecycle_policy](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_lifecycle_policy)

## Usage

```hcl
module "nas_lifecycle_policy" {
  source = "terraform-alibabacloudstack-modules/nas-lifecycle-policy/alibabacloudstack"

  file_system_id        = "nas-xxxx"
  lifecycle_policy_name = "my-lifecycle-policy"
  lifecycle_rule_name   = "DEFAULT_ATIME_30"
  path                  = "/data"
  oss_bucket            = "my-oss-bucket"
  recursive             = true
  storage_type          = "InfrequentAccess"
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
| file_system_id | The ID of the file system to apply lifecycle policy | `string` | n/a | yes |
| lifecycle_policy_name | Lifecycle policy name | `string` | n/a | yes |
| lifecycle_rule_name | Lifecycle rule name (DEFAULT_ATIME_14/30/60/90) | `string` | n/a | yes |
| path | Absolute path for lifecycle policy | `string` | `"/"` | no |
| oss_bucket | OSS bucket name for lifecycle policy | `string` | n/a | yes |
| recursive | Whether to recursively apply lifecycle policy to sub-paths | `bool` | `false` | no |
| storage_type | The type of storage after the data dump | `string` | `"InfrequentAccess"` | no |

## Outputs

| Name | Description |
|------|-------------|
| lifecycle_policy_id | The ID of the created lifecycle policy |
| create_time | The creation time of the lifecycle policy |

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
