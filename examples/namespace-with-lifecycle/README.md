# NAS Namespace with Lifecycle Policy

This example demonstrates how to create a NAS file system and apply a lifecycle policy for automated data management.

## Usage

To run this example, you need to execute:

```hcl
terraform init
terraform plan
terraform apply
```

When you no longer need these resources, run `terraform destroy`.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.6 |
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## Providers

| Name | Version |
|------|---------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| lifecycle_policy | ../../modules/nas_lifecycle_policy | n/a |

## Resources

| Name | Type |
|------|------|
| alibabacloudstack_nas_file_system_existing | resource |
| alibabacloudstack_oss_bucket_lifecycle_bucket | resource |
| alibabacloudstack_nas_zones_existing | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The prefix for the resource names. | `string` | `"tf-lifecycle"` | no |

## Outputs

No outputs.