# VPC Namespace for NAS

此示例演示如何创建带有 VPC 访问组和挂载目标的 NAS namespace。

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
| vpc\_namespace | ../../modules/nas_namespace | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| alibabacloudstack\_vpc\_vpc\_existing | resource |
| alibabacloudstack\_vpc\_vswitch\_existing | resource |
| alibabacloudstack\_zones\_existing | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| description | NAS namespace 的描述。 | `string` | `"tf-namespace3"` | 否 |

## 输出变量

无输出变量。
