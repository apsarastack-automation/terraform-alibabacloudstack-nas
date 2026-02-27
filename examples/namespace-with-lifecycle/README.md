# NAS Namespace with Lifecycle Policy

This example demonstrates how to create a NAS file system and apply a lifecycle policy for automatic data management.

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
| <a name="module_lifecycle_policy"></a> [lifecycle\_policy](#module\_lifecycle\_policy) | ../../modules/nas_lifecycle_policy | n/a |

## Resources

| Name | Type |
|------|------|
| <a name="resource_alibabacloudstack_nas_file_system_existing"></a> [alibabacloudstack\_nas\_file\_system\_existing](#resource\_alibabacloudstack\_nas\_file\_system\_existing) | resource |
| <a name="resource_alibabacloudstack_oss_bucket_lifecycle_bucket"></a> [alibabacloudstack\_oss\_bucket\_lifecycle\_bucket](#resource\_alibabacloudstack\_oss\_bucket\_lifecycle\_bucket) | resource |
| <a name="data_alibabacloudstack_nas_zones_existing"></a> [alibabacloudstack\_nas\_zones\_existing](#data\_alibabacloudstack\_nas\_zones\_existing) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="input_name"></a> [name](#input\_name) | Name prefix for resources. | `string` | `"tf-lifecycle"` | no |

## Outputs

No outputs.
