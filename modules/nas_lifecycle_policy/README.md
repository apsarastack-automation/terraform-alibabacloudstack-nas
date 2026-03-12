# Terraform Module for Creating NAS (Network Attached Storage) Lifecycle Policies on Alibaba Cloud Stack

terraform-alibabacloudstack-nas-lifecycle-policy
---

This module is used to create NAS (Network Attached Storage) lifecycle policies on Alibaba Cloud Stack, enabling automated data lifecycle management.

It supports the following resource types:

* alibabacloudstack_nas_lifecycle_policy

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
| file_system_id | The ID of the file system to which the lifecycle policy will be applied | `string` | n/a | yes |
| lifecycle_policy_name | The name of the lifecycle policy | `string` | n/a | yes |
| lifecycle_rule_name | The name of the lifecycle rule (DEFAULT_ATIME_14/30/60/90) | `string` | n/a | yes |
| path | The absolute path for the lifecycle policy | `string` | `"/"` | no |
| oss_bucket | The name of the OSS bucket for the lifecycle policy | `string` | n/a | yes |
| recursive | Whether to recursively apply the lifecycle policy to sub-paths | `bool` | `false` | no |
| storage_type | The storage type after data archiving | `string` | `"InfrequentAccess"` | no |

## Outputs

| Name | Description |
|------|------|
| lifecycle_policy_id | The ID of the created lifecycle policy |
| create_time | The creation time of the lifecycle policy |

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