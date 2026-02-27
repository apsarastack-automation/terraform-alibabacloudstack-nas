# 现有 NAS Namespace

此示例演示如何使用现有的 NAS namespace 并为其添加文件系统和访问组。

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
| <a name="module_existing_namespace"></a> [existing\_namespace](#module\_existing\_namespace) | ../../modules/nas_namespace | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| <a name="resource_alibabacloudstack_nas_namespace_existing"></a> [alibabacloudstack\_nas\_namespace\_existing](#resource\_alibabacloudstack\_nas\_namespace\_existing) | resource |
| <a name="data_alibabacloudstack_nas_zones_existing"></a> [alibabacloudstack\_nas\_zones\_existing](#data\_alibabacloudstack\_nas\_zones\_existing) | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| <a name="input_description"></a> [description](#input\_description) | NAS namespace 的描述。 | `string` | `"tf-namespace2"` | 否 |
| <a name="input_filesystems"></a> [filesystems](#input\_filesystems) | 要创建并附加到 namespace 的文件系统配置列表。 | `list(string)` | <pre>[<br>  "test1",<br>  "test2"<br>]</pre> | 否 |

## 输出变量

无输出变量。
