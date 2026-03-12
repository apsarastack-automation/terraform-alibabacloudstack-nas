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
| terraform | >= 1.5.6 |
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 提供商

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 模块

| 名称 | 来源 | 版本 |
|------|------|------|
| nas_multiple_access_groups | ../../modules/nas_file_system | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| alibabacloudstack_vpc_vpc_existing | resource |
| alibabacloudstack_vpc_vswitch_existing | resource |
| alibabacloudstack_zones_existing | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| description | NAS 文件系统的描述。 | `string` | `"tftest0"` | 否 |
| quota_path | 目录配额的路径。 | `string` | `"/"` | 否 |

## 输出变量

无输出变量。