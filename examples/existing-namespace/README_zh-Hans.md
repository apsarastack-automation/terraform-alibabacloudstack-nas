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
| terraform | >= 1.5.6 |
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 提供商

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 模块

| 名称 | 来源 | 版本 |
|------|------|------|
| existing_namespace | ../../modules/nas_namespace | n/a |

## 资源

| 名称 | 类型 |
|------|------|
| alibabacloudstack_nas_namespace_existing | resource |
| alibabacloudstack_nas_zones_existing | data source |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| description | NAS namespace 的描述。 | `string` | `"tf-namespace2"` | 否 |
| filesystems | 要创建并附加到 namespace 的文件系统配置列表。 | `list(string)` | <pre>[<br>  "test1",<br>  "test2"<br>]</pre> | 否 |

## 输出变量

无输出变量。