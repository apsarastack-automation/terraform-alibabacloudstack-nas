Terraform 模块用于在阿里云 Stack 上创建 NAS（网络附加存储）命名空间

terraform-alibabacloudstack-nas-namespace
---

该模块用于在阿里云 Stack 上创建 NAS（网络附加存储）命名空间，包括文件系统、访问组、挂载目标和命名空间组。

支持以下资源类型：

* [alibabacloudstack_nas_namespace](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace)
* [alibabacloudstack_nas_file_system](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_file_system)
* [alibabacloudstack_nas_namespace_filesystem_attachment](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace_filesystem_attachment)
* [alibabacloudstack_nas_accessgroup](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_accessgroup)
* [alibabacloudstack_nas_namespace_mount_target](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace_mount_target)
* [alibabacloudstack_nas_namespace_group](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/nas_namespace_group)

## 使用方法

```hcl
module "nas_namespace" {
  source = "terraform-alibabacloudstack-modules/nas-namespace/alibabacloudstack"

  description = "My NAS namespace"
  
  # 要创建并附加的文件系统
  filesystems = ["fs1", "fs2"]
  
  # 访问组配置
  accessgroups = [
    {
      access_group_name = "my-access-group"
      mapped_path       = "/data"
      vswitch_id        = "vsw-xxx"
    }
  ]
}
```

## 注意事项

* 本模块使用的 AccessKey 和 SecretKey 来自 `profile` 和 `shared_credentials_file`。如果您尚未设置它们，请安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 并进行配置。

## 要求

| 名称 | 版本 |
|------|------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alibabacloudstack"></a> [alibabacloudstack](#requirement\_alibabacloudstack) | >= 1.0 |

## 提供商

| 名称 | 版本 |
|------|------|
| <a name="provider_alibabacloudstack"></a> [alibabacloudstack](#provider\_alibabacloudstack) | >= 1.0 |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| description | NAS 命名空间的描述 | `string` | `"Managed by Terraform"` | 否 |
| nas_namespace_id | 现有 NAS 命名空间 ID。如果提供，将使用现有命名空间而不是创建新命名空间 | `string` | `""` | 否 |
| filesystems | 要创建并附加到命名空间的文件系统配置列表 | `list(string)` | `[]` | 否 |
| accessgroups | 访问组配置列表 | `list(object)` | `[]` | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| nas_namespace_id | NAS 命名空间的 ID |
| filesystem_ids | 创建的文件系统 ID 列表 |
| access_group_ids | 创建的访问组 ID 列表 |
| mount_target_domains | VPC 访问组的挂载目标域名列表 |
| namespace_group_ids | 命名空间组 ID 列表 |

## 提交问题

如果您在使用此模块时遇到任何问题，请提交 [provider issue](https://github.com/aliyun/terraform-provider-alibabacloudstack/issues/new) 并告知我们。

**注意：** 不建议在此仓库上提交 issue。

## 作者

由阿里云 Terraform 团队创建和维护 (terraform@alibabacloud.com)

## 许可证

MIT 许可证。详情请参见 LICENSE。

## 参考

* [Terraform-Provider-Alibabacloudstack Github](https://github.com/aliyun/terraform-provider-alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack Release](https://registry.terraform.io/providers/aliyun/alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack 文档](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs)
