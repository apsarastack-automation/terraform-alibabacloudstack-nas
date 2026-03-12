# Terraform 模块用于在阿里云 Stack 上创建 NAS（网络附加存储）文件系统

terraform-alibabacloudstack-nas-file-system
---

该模块用于在阿里云 Stack 上创建 NAS（网络附加存储）文件系统，包括访问组、挂载目标和目录配额。

支持以下资源类型：

* alibabacloudstack_nas_file_system
* alibabacloudstack_nas_accessgroup
* alibabacloudstack_nas_mounttarget
* alibabacloudstack_nas_dir_quota

## 使用方法

```hcl
module "nas_file_system" {
  source = "terraform-alibabacloudstack-modules/nas-file-system/alibabacloudstack"

  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "My NAS file system"
  
  # 挂载目标配置
  mounts = [
    {
      access_group_name = "my-access-group"
      vswitch_id        = "vsw-xxx"
    }
  ]
  
  # 目录配额（可选）
  quota_path = "/data"
  quotas = [
    {
      quota_type       = "User"
      user_type        = "LocalUser"
      user_id          = "0"
      size_limit       = 1073741824
      file_count_limit = 10000
    }
  ]
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
| protocol_type | 文件传输协议类型 | `string` | `""` | 否 |
| storage_type | 存储类型 | `string` | `""` | 否 |
| description | 文件系统描述 | `string` | n/a | 是 |
| mounts | 访问组配置列表 | `list(object)` | `[]` | 否 |
| quota_path | 是否启用目录配额 | `string` | `"/"` | 否 |
| quotas | 配额配置列表 | `list(object)` | `[]` | 否 |
| nas_file_system_id | 现有文件系统 ID | `string` | `""` | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| file_system_id | 创建的文件系统 ID |
| file_system_description | 文件系统描述 |
| quota_status | 目录配额状态 |
| protocol_type | 文件系统协议类型 |
| storage_type | 文件系统存储类型 |

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
