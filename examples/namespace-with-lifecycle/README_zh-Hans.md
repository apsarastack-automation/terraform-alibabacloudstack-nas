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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_alibabacloudstack"></a> [alibabacloudstack](#requirement\_alibabacloudstack) | >= 3.18 |

## 提供商

| 名称 | 版本 |
|------|------|
| <a name="provider_alibabacloudstack"></a> [alibabacloudstack](#provider\_alibabacloudstack) | >= 3.18 |

## 模块

| 名称 | 来源 | 版本 |
|------|------|------|
| <a name="module_lifecycle_policy"></a> [lifecycle\_policy](#module\_lifecycle\_policy) | ../../modules/nas_lifecycle_policy | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| <a name="resource_alibabacloudstack_nas_file_system_existing"></a> [alibabacloudstack\_nas\_file\_system\_existing](#resource\_alibabacloudstack\_nas\_file\_system\_existing) | resource |
| <a name="resource_alibabacloudstack_oss_bucket_lifecycle_bucket"></a> [alibabacloudstack\_oss\_bucket\_lifecycle\_bucket](#resource\_alibabacloudstack\_oss\_bucket\_lifecycle\_bucket) | resource |
| <a name="data_alibabacloudstack_nas_zones_existing"></a> [alibabacloudstack\_nas\_zones\_existing](#data\_alibabacloudstack\_nas\_zones\_existing) | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| <a name="input_name"></a> [name](#input\_name) | 资源名称前缀。 | `string` | `"tf-lifecycle"` | 否 |

## 输出变量

无输出变量。
