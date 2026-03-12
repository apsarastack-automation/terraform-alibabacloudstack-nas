# Terraform 模块用于在阿里云 Stack 上创建 NAS（网络附加存储）生命周期策略

terraform-alibabacloudstack-nas-lifecycle-policy
---

该模块用于在阿里云 Stack 上创建 NAS（网络附加存储）生命周期策略，实现数据的自动生命周期管理。

支持以下资源类型：

* alibabacloudstack_nas_lifecycle_policy

## 使用方法

```hcl
module "nas_lifecycle_policy" {
  source = "terraform-alibabacloudstack-modules/nas-lifecycle-policy/alibabacloudstack"

  file_system_id        = "nas-xxxx"
  lifecycle_policy_name = "my-lifecycle-policy"
  lifecycle_rule_name   = "DEFAULT_ATIME_30"
  path                  = "/data"
  oss_bucket            = "my-oss-bucket"
  recursive             = true
  storage_type          = "InfrequentAccess"
}
```

## 要求

| 名称 | 版本 |
|------|------|
| terraform | >= 1.5.6 |

## 提供商

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.23, < 3.19.0 |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| file_system_id | 要应用生命周期策略的文件系统 ID | `string` | n/a | 是 |
| lifecycle_policy_name | 生命周期策略名称 | `string` | n/a | 是 |
| lifecycle_rule_name | 生命周期规则名称（DEFAULT_ATIME_14/30/60/90） | `string` | n/a | 是 |
| path | 生命周期策略的绝对路径 | `string` | `"/"` | 否 |
| oss_bucket | 生命周期策略的 OSS 存储桶名称 | `string` | n/a | 是 |
| recursive | 是否递归地将生命周期策略应用于子路径 | `bool` | `false` | 否 |
| storage_type | 数据转储后的存储类型 | `string` | `"InfrequentAccess"` | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| lifecycle_policy_id | 创建的生命周期策略 ID |
| create_time | 生命周期策略的创建时间 |

## 提交问题

如果您在使用此模块时遇到任何问题，请提交 [provider issue](https://github.com/aliyun/terraform-provider-alibabacloudstack/issues/new) 并告知我们。

## 作者

由阿里云 Terraform 团队创建和维护

## 许可证

MIT 许可证。详情请参见 LICENSE。

## 参考

* [Terraform-Provider-Alibabacloudstack Github](https://github.com/aliyun/terraform-provider-alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack Release](https://registry.terraform.io/providers/aliyun/alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack 文档](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs)
