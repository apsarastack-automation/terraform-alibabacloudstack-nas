# Existing NAS Namespace

This example demonstrates how to use an existing NAS namespace and add file systems and access groups to it.

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
| existing_namespace | ../../modules/nas_namespace | n/a |

## Resources

| Name | Type |
|------|------|
| alibabacloudstack_nas_namespace_existing | resource |
| alibabacloudstack_nas_zones_existing | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | The description of the NAS namespace. | `string` | `"tf-namespace2"` | no |
| filesystems | A list of file system configurations to be created and attached to the namespace. | `list(string)` | <pre>[<br>  "test1",<br>  "test2"<br>]</pre> | no |

## Outputs

No outputs.