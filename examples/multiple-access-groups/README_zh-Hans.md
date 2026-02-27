# NAS 多访问组

此示例演示如何创建带有多个访问组和挂载目标的 NAS 文件系统。

## 使用方法

要运行此示例，您需要执行：

```hcl
terraform init
terraform plan
terraform apply
```

当您不再需要这些资源时，请运行 `terraform destroy`。

## 要求

| 名称 | 版本 |
|------|------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_alibabacloudstack"></a> [alibabacloudstack](#requirement\_alibabacloudstack) | >= 3.18 |

## 提供商

| 名称 | 版本 |
|------|------|
| <a name="provider_alibabacloudstack"></a> [alibabacloudstack](#provider\_alibabacloudstack) | >= 3.18 |

## 模块

| 名称 | 来源 | 版本 |
|------|------|------|
| <a name="module_nas_multiple_access_groups"></a> [nas\_multiple\_access\_groups](#module\_nas\_multiple\_access\_groups) | ../../modules/nas_file_system | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| <a name="resource_alibabacloudstack_vpc_vpc_existing"></a> [alibabacloudstack\_vpc\_vpc\_existing](#resource\_alibabacloudstack\_vpc\_vpc\_existing) | resource |
| <a name="resource_alibabacloudstack_vpc_vswitch_existing"></a> [alibabacloudstack\_vpc\_vswitch\_existing](#resource\_alibabacloudstack\_vpc\_vswitch\_existing) | resource |
| <a name="data_alibabacloudstack_zones_existing"></a> [alibabacloudstack\_zones\_existing](#data\_alibabacloudstack\_zones\_existing) | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| <a name="input_description"></a> [description](#input\_description) | NAS 文件系统的描述。 | `string` | `"tftest0"` | 否 |
| <a name="input_quota_path"></a> [quota\_path](#input\_quota\_path) | 目录配额的路径。 | `string` | `"/"` | 否 |

## 输出变量

无输出变量。
