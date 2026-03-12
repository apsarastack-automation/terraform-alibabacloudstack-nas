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
| terraform | >= 1.5.6 |
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 提供商

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 模块

| 名称 | 来源 | 版本 |
|------|------|------|
| basic_namespace | ../../modules/nas_namespace | n/a |

## 资源

无资源。

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| description | NAS namespace 的描述。 | `string` | `"tf-namespace1"` | 否 |
| filesystems | 要创建并附加到 namespace 的文件系统配置列表。 | `list(string)` | <pre>[<br>  "test1",<br>  "test2"<br>]</pre> | 否 |

## 输出变量

无输出变量。