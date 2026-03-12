# NAS Multiple Access Groups

This example demonstrates how to create a NAS file system with multiple access groups and mount targets.

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
| nas_multiple_access_groups | ../../modules/nas_file_system | n/a |

## Resources

| Name | Type |
|------|------|
| alibabacloudstack_vpc_vpc_existing | resource |
| alibabacloudstack_vpc_vswitch_existing | resource |
| alibabacloudstack_zones_existing | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | The description of the NAS file system. | `string` | `"tftest0"` | no |
| quota_path | The path for the directory quota. | `string` | `"/"` | no |

## Outputs

No outputs.