# 带生命周期策略的 NAS Namespace

此示例演示如何创建 NAS 文件系统并应用生命周期策略以实现自动数据管理。

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
| lifecycle_policy | ../../modules/nas_lifecycle_policy | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| alibabacloudstack_nas_file_system_existing | resource |
| alibabacloudstack_oss_bucket_lifecycle_bucket | resource |
| alibabacloudstack_nas_zones_existing | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| name | 资源名称前缀。 | `string` | `"tf-lifecycle"` | 否 |

## 输出变量

无输出变量。