# VPC Namespace for NAS

This example demonstrates how to create a NAS namespace with VPC access groups and mount targets.

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
|------|------|
| terraform | >= 1.5.6 |
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## Providers

| Name | Version |
|------|------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## Modules

| Name | Source | Version |
|------|------|------|
| vpc\_namespace | ../../modules/nas_namespace | n/a |

## Resources

| Name | Type |
|------|------|
| alibabacloudstack\_vpc\_vpc\_existing | resource |
| alibabacloudstack\_vpc\_vswitch\_existing | resource |
| alibabacloudstack\_zones\_existing | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|------|------|--------|------|
| description | The description of the NAS namespace. | `string` | `"tf-namespace3"` | no |

## Outputs

No outputs.