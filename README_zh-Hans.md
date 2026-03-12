# Terraform 阿里云CloudStack NAS Namespace 模块

## 概述

该模块提供阿里云NAS（网络附加存储）namespace的全面管理功能，包括文件系统创建、访问组管理和生命周期策略。

## 功能特性

- ✅ 自动创建NAS namespace，支持自动配置检测
- ✅ 支持通过ID集成现有namespace
- ✅ 多文件系统创建和namespace绑定
- ✅ 访问组管理，支持VPC/经典网络
- ✅ VPC访问组的自动挂载点创建
- ✅ 跨域挂载编排
- ✅ 生命周期策略管理，集成OSS
- ✅ 通过参数化输入实现灵活配置

## 架构设计

模块实现了以下资源关系：

```
NAS Namespace
├── File Systems (1对多)
│   ├── File System Attachments
│   └── Lifecycle Policies (可选)
├── Access Groups (1对多)
│   ├── Mount Targets (针对VPC组)
│   └── Namespace Groups (跨域编排)
└── Namespace Mount Targets
```

## 使用示例

### 基础Namespace创建

```hcl
module "nas_namespace" {
  source = "terraform-alibabacloudstack-modules/terraform-alibabacloudstack-nas"
  
  name        = "my-nas-namespace"
  description = "生产环境NAS namespace"
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Capacity"
      description   = "主文件系统"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "web-servers"
      access_group_type = "Classic"
    }
  ]
}
```

### VPC网络集成

```hcl
data "alibabacloudstack_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alibabacloudstack_vpc_vpc" "default" {
  vpc_name   = "nas-vpc"
  cidr_block = "172.16.0.0/16"
}

resource "alibabacloudstack_vpc_vswitch" "default" {
  vpc_id     = alibabacloudstack_vpc_vpc.default.id
  cidr_block = "172.16.1.0/24"
  zone_id    = data.alibabacloudstack_zones.default.zones[0].id
}

module "vpc_nas_namespace" {
  source = "terraform-alibabacloudstack-modules/terraform-alibabacloudstack-nas"
  
  name        = "vpc-nas-namespace"
  description = "VPC集成的NAS namespace"
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Performance"
      description   = "vpc文件系统"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "app-servers"
      access_group_type = "Vpc"
      vswitch_id        = alibabacloudstack_vpc_vswitch.default.id
    }
  ]
}
```

### 多文件系统与生命周期策略

```hcl
resource "alibabacloudstack_oss_bucket" "backup" {
  bucket = "nas-backup-bucket"
  acl    = "private"
}

module "advanced_nas_namespace" {
  source = "terraform-alibabacloudstack-modules/terraform-alibabacloudstack-nas"
  
  name        = "advanced-nas"
  description = "带多文件系统的高级NAS"
  
  filesystems = [
    {
      protocol_type    = "NFS"
      storage_type     = "Capacity"
      encrypt_type     = "1"
      description      = "主存储"
    },
    {
      protocol_type    = "NFS"
      storage_type     = "Performance"
      encrypt_type     = "1"
      description      = "高性能存储"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "production-servers"
      access_group_type = "Vpc"
      vswitch_id        = var.vswitch_id
    }
  ]
  
  # 生命周期策略用于自动化数据管理
  lifecycle_policy_name = "数据归档策略"
  lifecycle_rule_name   = "DEFAULT_ATIME_30"
  path                  = "/"
  oss_bucket            = alibabacloudstack_oss_bucket.backup.id
  recursive             = true
}
```

### 使用现有Namespace

```hcl
module "existing_namespace" {
  source = "terraform-alibabacloudstack-modules/terraform-alibabacloudstack-nas"
  
  name             = "extended-namespace"
  description      = "向现有namespace添加资源"
  nas_namespace_id = "ns-123456789"  # 现有namespace ID
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Capacity"
      description   = "额外存储"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "new-application-group"
      access_group_type = "Classic"
    }
  ]
}
```

## 变量说明

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| `name` | 所有资源的名称前缀 | `string` | `"terraform-nas-namespace"` | 否 |
| `description` | NAS namespace描述 | `string` | `"Managed by Terraform"` | 否 |
| `nas_namespace_id` | 现有NAS namespace ID | `string` | `""` | 否 |
| `filesystems` | 文件系统配置列表 | `list(object)` | `[]` | 否 |
| `accessgroups` | 访问组配置列表 | `list(object)` | `[]` | 否 |
| `lifecycle_policy_name` | 生命周期策略名称 | `string` | `""` | 否 |
| `lifecycle_rule_name` | 生命周期规则(DEFAULT_ATIME_14/30/60/90) | `string` | `""` | 否 |
| `path` | 生命周期策略的绝对路径 | `string` | `"/"` | 否 |
| `oss_bucket` | 生命周期策略的OSS bucket名称 | `string` | `""` | 否 |
| `recursive` | 递归应用生命周期策略 | `bool` | `false` | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| `nas_namespace_id` | NAS namespace的ID |
| `filesystem_ids` | 创建的文件系统ID列表 |
| `access_group_ids` | 创建的访问组ID列表 |
| `mount_target_domains` | 挂载点域名列表 |
| `namespace_group_ids` | namespace组ID列表 |
| `lifecycle_policy_id` | 生命周期策略ID |
| `filesystem_attachments` | 文件系统绑定ID列表 |

## 环境要求

| 名称 | 版本 |
|------|------|
| terraform | >= 1.5.6 |
| alibabacloudstack provider | >= 3.18.23, < 3.19.0 |

## 使用的Provider

- `alibabacloudstack` - 用于所有NAS资源

## 创建的资源

1. **核心资源**:
   - `alibabacloudstack_nas_namespace` - Namespace创建(条件性)
   - `alibabacloudstack_nas_file_system` - 文件系统创建(多个)
   - `alibabacloudstack_nas_accessgroup` - 访问组创建(多个)

2. **绑定资源**:
   - `alibabacloudstack_nas_namespace_filesystem_attachment` - 文件系统到namespace的绑定
   - `alibabacloudstack_nas_namespace_mount_target` - 挂载点创建
   - `alibabacloudstack_nas_namespace_group` - 跨域编排

3. **可选资源**:
   - `alibabacloudstack_nas_lifecycle_policy` - 数据生命周期管理

## 最佳实践

### 1. 命名规范
```hcl
# 使用描述性前缀
name = "prod-nas-${var.environment}-${var.application}"
```

### 2. 安全配置
```hcl
filesystems = [
  {
    protocol_type = "NFS"
    storage_type  = "Capacity"
    encrypt_type  = "1"  # 启用加密
    description   = "安全文件系统"
  }
]
```

### 3. 资源组织
```hcl
# 按用途分离文件系统
filesystems = [
  {
    protocol_type = "NFS"
    storage_type  = "Performance"
    description   = "数据库存储"
  },
  {
    protocol_type = "NFS"
    storage_type  = "Capacity"
    description   = "应用日志"
  }
]
```

## 故障排除

### 常见问题

1. **Namespace创建失败**
   ```bash
   # 错误: 区域不可用
   # 解决方案: 检查所选协议/存储类型的区域可用性
   ```

2. **访问组绑定问题**
   ```bash
   # 错误: 找不到VSwitch
   # 解决方案: 验证VSwitch ID存在且在正确区域
   ```

3. **生命周期策略错误**
   ```bash
   # 错误: 无效的生命周期规则
   # 解决方案: 使用支持的规则(DEFAULT_ATIME_14/30/60/90)
   ```