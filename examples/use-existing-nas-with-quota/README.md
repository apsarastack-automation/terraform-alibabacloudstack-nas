# Use Existing NAS and Configure Quotas

This example demonstrates how to use an existing NAS file system and configure directory quotas.

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
| nas_example_2 | ../../modules/nas_file_system | n/a |

## Resources

| Name | Type |
|------|------|
| alibabacloudstack_nas_file_system_default | resource |
| alibabacloudstack_nas_zones_default | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | The description of the NAS file system. | `string` | `"tftest1"` | no |
| quota_path | The path for the directory quota. | `string` | `"/"` | no |
| quotas | A list of quota configurations. | `list(object)` | <pre>[<br>  {<br>    quota_type = "Enforcement"<br>    user_type = "Uid"<br>    user_id = "1001"<br>    size_limit = 500<br>    file_count_limit = 50000<br>  },<br>  {<br>    quota_type = "Accounting"<br>    user_type = "Uid"<br>    user_id = "1000"<br>    size_limit = 0<br>    file_count_limit = 0<br>  }<br>]</pre> | no |

## Outputs

No outputs.