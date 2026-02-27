# 使用现有 NAS 并配置配额

此示例演示如何使用现有的 NAS 文件系统并配置目录配额。

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
| <a name="module_nas_example_2"></a> [nas\_example\_2](#module\_nas\_example\_2) | ../../modules/nas_file_system | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| <a name="resource_alibabacloudstack_nas_file_system_default"></a> [alibabacloudstack\_nas\_file\_system\_default](#resource\_alibabacloudstack\_nas\_file\_system\_default) | resource |
| <a name="data_alibabacloudstack_nas_zones_default"></a> [alibabacloudstack\_nas\_zones\_default](#data\_alibabacloudstack\_nas\_zones\_default) | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| <a name="input_description"></a> [description](#input\_description) | NAS 文件系统的描述。 | `string` | `"tftest1"` | 否 |
| <a name="input_quota_path"></a> [quota\_path](#input\_quota\_path) | 目录配额的路径。 | `string` | `"/"` | 否 |
| <a name="input_quotas"></a> [quotas](#input\_quotas) | 配额配置列表。 | `list(object)` | <pre>[<br>  {<br>    quota_type = "Enforcement"<br>    user_type = "Uid"<br>    user_id = "1001"<br>    size_limit = 500<br>    file_count_limit = 50000<br>  },<br>  {<br>    quota_type = "Accounting"<br>    user_type = "Uid"<br>    user_id = "1000"<br>    size_limit = 0<br>    file_count_limit = 0<br>  }<br>]</pre> | 否 |

## 输出变量

无输出变量。
