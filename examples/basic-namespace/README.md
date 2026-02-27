# Basic NAS Namespace

This example creates a basic NAS namespace with file systems.

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
| <a name="module_basic_namespace"></a> [basic\_namespace](#module\_basic\_namespace) | ../../modules/nas_namespace | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="input_description"></a> [description](#input\_description) | Description for the NAS namespace. | `string` | `"tf-namespace1"` | no |
| <a name="input_filesystems"></a> [filesystems](#input\_filesystems) | List of filesystem configurations to create and attach to namespace. | `list(string)` | <pre>[<br>  "test1",<br>  "test2"<br>]</pre> | no |

## Outputs

No outputs.
