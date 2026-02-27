# 基础 NAS Namespace

此示例创建一个基础的 NAS namespace 并附加文件系统。

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
| <a name="module_basic_namespace"></a> [basic\_namespace](#module\_basic\_namespace) | ../../modules/nas_namespace | n/a |

## 资源

无资源。

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| <a name="input_description"></a> [description](#input\_description) | NAS namespace 的描述。 | `string` | `"tf-namespace1"` | 否 |
| <a name="input_filesystems"></a> [filesystems](#input\_filesystems) | 要创建并附加到 namespace 的文件系统配置列表。 | `list(string)` | <pre>[<br>  "test1",<br>  "test2"<br>]</pre> | 否 |

## 输出变量

无输出变量。
