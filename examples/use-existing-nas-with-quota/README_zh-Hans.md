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
| terraform | >= 1.5.6 |
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 提供商

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 模块

| 名称 | 来源 | 版本 |
|------|------|------|
| nas_example_2 | ../../modules/nas_file_system | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| alibabacloudstack_nas_file_system_default | resource |
| alibabacloudstack_nas_zones_default | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| description | NAS 文件系统的描述。 | `string` | `"tftest1"` | 否 |
| quota_path | 目录配额的路径。 | `string` | `"/"` | 否 |
| quotas | 配额配置列表。 | `list(object)` | <pre>[<br>  {<br>    quota_type = "Enforcement"<br>    user_type = "Uid"<br>    user_id = "1001"<br>    size_limit = 500<br>    file_count_limit = 50000<br>  },<br>  {<br>    quota_type = "Accounting"<br>    user_type = "Uid"<br>    user_id = "1000"<br>    size_limit = 0<br>    file_count_limit = 0<br>  }<br>]</pre> | 否 |

## 输出变量

无输出变量。