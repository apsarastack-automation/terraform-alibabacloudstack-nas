# Basic NAS Namespace

This example creates a basic NAS namespace and attaches file systems to it.

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
| basic_namespace | ../../modules/nas_namespace | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | The description of the NAS namespace. | `string` | `"tf-namespace1"` | no |
| filesystems | A list of file system configurations to be created and attached to the namespace. | `list(string)` | <pre>[<br>  "test1",<br>  "test2"<br>]</pre> | no |

## Outputs

No outputs.