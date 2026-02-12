# 阿里云NAS模块

此模块管理阿里云网络附加存储(NAS)资源，包括文件系统、挂载点、访问组和目录配额。

## 功能特性

- 创建NAS文件系统（标准型、极速型、CPFS类型）
- 管理带VPC集成的挂载点
- 配置用于权限控制的访问组
- 设置目录配额限制容量和文件数量
- 支持创建新文件系统和使用现有文件系统

## 使用方法

### 基础示例

```hcl
module "nas" {
  source = "terraform-alibabacloudstack-modules/nas"

  name             = "my-nas-file-system"
  file_system_type = "standard"
  protocol_type    = "NFS"
  storage_type     = "Capacity"
  description      = "我的NAS文件系统"
  encrypt_type     = "1"
  mount            = true
  access_group_type = "Vpc"
}
```

### 带配额的高级示例

```hcl
module "nas_with_quotas" {
  source = "terraform-alibabacloudstack-modules/nas"

  name             = "advanced-nas"
  file_system_type = "extreme"
  protocol_type    = "NFS"
  storage_type     = "standard"
  capacity         = 500
  zone_id          = "cn-hangzhou-a"
  
  mount            = true
  vswitch_id       = "vsw-xxxxxxxxx"
  access_group_name = "my-access-group"
  
  quota_enabled    = true
  quota_path       = "/shared"
  quotas = [
    {
      quota_type       = "Enforcement"
      user_type        = "Uid"
      user_id          = "1001"
      size_limit       = 100
      file_count_limit = 10000
    }
  ]
}
```

## 变量参数

### 文件系统配置
- `name` - 资源名称前缀
- `file_system_type` - 文件系统类型（`standard`, `extreme`, `cpfs`）
- `protocol_type` - 协议类型（`NFS`, `SMB`, `cpfs`）
- `storage_type` - 存储类型（取决于文件系统类型）
- `description` - 文件系统描述
- `encrypt_type` - 加密类型（`0`=无加密, `1`=NAS托管, `2`=用户托管）
- `capacity` - 文件系统容量（GiB，极速型必填）
- `zone_id` - 可用区ID（极速型/CPFS必填）
- `kms_key_id` - 用户托管加密的KMS密钥ID

### 挂载点配置
- `mount` - 是否创建挂载点
- `vswitch_id` - VPC挂载点的交换机ID
- `status` - 挂载点状态（`Active`, `Inactive`）

### 访问组配置
- `access_group_name` - 现有访问组名称（为空则创建新的）
- `access_group_type` - 访问组类型（`Vpc`, `Classic`）

### 配额配置
- `quota_enabled` - 是否启用目录配额
- `quota_path` - 配额目录路径
- `quotas` - 配额配置列表

### 现有资源
- `nas_file_system_id` - 使用现有文件系统而非创建新的

## 输出变量

- `file_system_id` - 创建的文件系统ID
- `file_system_description` - 文件系统描述
- `mount_target_domain` - 挂载点域名
- `access_group_name` - 访问组名称
- `quota_status` - 目录配额状态
- `file_system_type` - 文件系统类型
- `protocol_type` - 协议类型
- `storage_type` - 存储类型
- `zone_id` - 可用区ID

## 示例

请查看 `examples/` 目录获取完整的可运行示例：
- `create-standard-nas/` - 带挂载点的标准NAS
- `use-existing-nas-with-quota/` - 使用现有NAS并设置配额

## 运行要求

- Terraform >= 0.13
- 阿里云提供商 >= 1.0