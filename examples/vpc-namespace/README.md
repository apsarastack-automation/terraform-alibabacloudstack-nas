# VPC Namespace for NAS

This example demonstrates how to create a NAS namespace with VPC access groups and mount targets.

## Usage

To run this example you need to execute:

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_alibabacloudstack"></a> [alibabacloudstack](#requirement\_alibabacloudstack) | >= 3.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alibabacloudstack"></a> [alibabacloudstack](#provider\_alibabacloudstack) | >= 3.18 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc_namespace"></a> [vpc\_namespace](#module\_vpc\_namespace) | ../../modules/nas_namespace | n/a |

## Resources

| Name | Type |
|------|------|
| <a name="resource_alibabacloudstack_vpc_vpc_existing"></a> [alibabacloudstack\_vpc\_vpc\_existing](#resource\_alibabacloudstack\_vpc\_vpc\_existing) | resource |
| <a name="resource_alibabacloudstack_vpc_vswitch_existing"></a> [alibabacloudstack\_vpc\_vswitch\_existing](#resource\_alibabacloudstack\_vpc\_vswitch\_existing) | resource |
| <a name="data_alibabacloudstack_zones_existing"></a> [alibabacloudstack\_zones\_existing](#data\_alibabacloudstack\_zones\_existing) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="input_description"></a> [description](#input\_description) | Description for the NAS namespace. | `string` | `"tf-namespace3"` | no |

## Outputs

No outputs.
