# Use Existing NAS with Quota

This example demonstrates how to use an existing NAS file system and configure directory quotas.

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
| <a name="module_nas_example_2"></a> [nas\_example\_2](#module\_nas\_example\_2) | ../../modules/nas_file_system | n/a |

## Resources

| Name | Type |
|------|------|
| <a name="resource_alibabacloudstack_nas_file_system_default"></a> [alibabacloudstack\_nas\_file\_system\_default](#resource\_alibabacloudstack\_nas\_file\_system\_default) | resource |
| <a name="data_alibabacloudstack_nas_zones_default"></a> [alibabacloudstack\_nas\_zones\_default](#data\_alibabacloudstack\_nas\_zones\_default) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="input_description"></a> [description](#input\_description) | Description for the NAS file system. | `string` | `"tftest1"` | no |
| <a name="input_quota_path"></a> [quota\_path](#input\_quota\_path) | Path for directory quota. | `string` | `"/"` | no |
| <a name="input_quotas"></a> [quotas](#input\_quotas) | List of quota configurations. | `list(object)` | <pre>[<br>  {<br>    quota_type = "Enforcement"<br>    user_type = "Uid"<br>    user_id = "1001"<br>    size_limit = 500<br>    file_count_limit = 50000<br>  },<br>  {<br>    quota_type = "Accounting"<br>    user_type = "Uid"<br>    user_id = "1000"<br>    size_limit = 0<br>    file_count_limit = 0<br>  }<br>]</pre> | no |

## Outputs

No outputs.
