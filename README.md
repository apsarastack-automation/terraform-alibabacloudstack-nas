# Terraform Alibaba CloudStack NAS Namespace Module

## Overview

This module provides comprehensive management of Alibaba Cloud NAS (Network Attached Storage) namespaces, including filesystem creation, access group management, and lifecycle policies.

## Features

- ✅ Automatic NAS namespace creation with auto-detected configurations
- ✅ Support for existing namespace integration via ID
- ✅ Multiple filesystem creation and namespace attachment
- ✅ Access group management with VPC/Classic network support
- ✅ Automated mount target creation for VPC access groups
- ✅ Cross-domain mount orchestration
- ✅ Lifecycle policy management with OSS integration
- ✅ Flexible configuration through parameterized inputs

## Architecture

The module implements the following resource relationships:

```
NAS Namespace
├── File Systems (1-to-many)
│   ├── File System Attachments
│   └── Lifecycle Policies (optional)
├── Access Groups (1-to-many)
│   ├── Mount Targets (for VPC groups)
│   └── Namespace Groups (cross-domain orchestration)
└── Namespace Mount Targets
```

## Usage Examples

### Basic Namespace Creation

```hcl
module "nas_namespace" {
  source = "terraform-alibabacloudstack-modules/terraform-alibabacloudstack-nas"
  
  name        = "my-nas-namespace"
  description = "Production NAS namespace"
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Capacity"
      description   = "main-file-system"
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

### VPC Network Integration

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
  description = "VPC integrated NAS namespace"
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Performance"
      description   = "vpc-file-system"
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

### Multiple Filesystems with Lifecycle Policy

```hcl
resource "alibabacloudstack_oss_bucket" "backup" {
  bucket = "nas-backup-bucket"
  acl    = "private"
}

module "advanced_nas_namespace" {
  source = "terraform-alibabacloudstack-modules/terraform-alibabacloudstack-nas"
  
  name        = "advanced-nas"
  description = "Advanced NAS with multiple filesystems"
  
  filesystems = [
    {
      protocol_type    = "NFS"
      storage_type     = "Capacity"
      encrypt_type     = "1"
      description      = "primary-storage"
    },
    {
      protocol_type    = "NFS"
      storage_type     = "Performance"
      encrypt_type     = "1"
      description      = "high-performance-storage"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "production-servers"
      access_group_type = "Vpc"
      vswitch_id        = var.vswitch_id
    }
  ]
  
  # Lifecycle policy for automated data management
  lifecycle_policy_name = "data-archive-policy"
  lifecycle_rule_name   = "DEFAULT_ATIME_30"
  path                  = "/"
  oss_bucket            = alibabacloudstack_oss_bucket.backup.id
  recursive             = true
}
```

### Using Existing Namespace

```hcl
module "existing_namespace" {
  source = "terraform-alibabacloudstack-modules/terraform-alibabacloudstack-nas"
  
  name             = "extended-namespace"
  description      = "Adding resources to existing namespace"
  nas_namespace_id = "ns-123456789"  # Existing namespace ID
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Capacity"
      description   = "additional-storage"
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

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `name` | The name prefix for all resources | `string` | `"terraform-nas-namespace"` | No |
| `description` | Description for the NAS namespace | `string` | `"Managed by Terraform"` | No |
| `nas_namespace_id` | Existing NAS namespace ID | `string` | `""` | No |
| `filesystems` | List of filesystem configurations | `list(object)` | `[]` | No |
| `accessgroups` | List of access group configurations | `list(object)` | `[]` | No |
| `lifecycle_policy_name` | Lifecycle policy name | `string` | `""` | No |
| `lifecycle_rule_name` | Lifecycle rule (DEFAULT_ATIME_14/30/60/90) | `string` | `""` | No |
| `path` | Absolute path for lifecycle policy | `string` | `"/"` | No |
| `oss_bucket` | OSS bucket name for lifecycle policy | `string` | `""` | No |
| `recursive` | Recursively apply lifecycle policy | `bool` | `false` | No |

## Outputs

| Name | Description |
|------|-------------|
| `nas_namespace_id` | The ID of the NAS namespace |
| `filesystem_ids` | List of created filesystem IDs |
| `access_group_ids` | List of created access group IDs |
| `mount_target_domains` | List of mount target domains |
| `namespace_group_ids` | List of namespace group IDs |
| `lifecycle_policy_id` | The ID of the lifecycle policy |
| `filesystem_attachments` | List of filesystem attachment IDs |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.6 |
| alibabacloudstack provider | >= 3.18.23, < 3.19.0 |

## Providers

- `alibabacloudstack` - Used for all NAS resources

## Resources Created

1. **Core Resources**:
   - `alibabacloudstack_nas_namespace` - Namespace creation (conditional)
   - `alibabacloudstack_nas_file_system` - Filesystem creation (multiple)
   - `alibabacloudstack_nas_accessgroup` - Access group creation (multiple)

2. **Binding Resources**:
   - `alibabacloudstack_nas_namespace_filesystem_attachment` - Filesystem to namespace binding
   - `alibabacloudstack_nas_namespace_mount_target` - Mount target creation
   - `alibabacloudstack_nas_namespace_group` - Cross-domain orchestration

3. **Optional Resources**:
   - `alibabacloudstack_nas_lifecycle_policy` - Data lifecycle management

## Best Practices

### 1. Naming Convention
```hcl
# Use descriptive prefixes
name = "prod-nas-${var.environment}-${var.application}"
```

### 2. Security Configuration
```hcl
filesystems = [
  {
    protocol_type = "NFS"
    storage_type  = "Capacity"
    encrypt_type  = "1"  # Enable encryption
    description   = "secure-file-system"
  }
]
```

### 3. Resource Organization
```hcl
# Separate filesystems by purpose
filesystems = [
  {
    protocol_type = "NFS"
    storage_type  = "Performance"
    description   = "database-storage"
  },
  {
    protocol_type = "NFS"
    storage_type  = "Capacity"
    description   = "application-logs"
  }
]
```

## Troubleshooting

### Common Issues

1. **Namespace Creation Failures**
   ```bash
   # Error: Zone not available
   # Solution: Check zone availability for selected protocol/storage type
   ```

2. **Access Group Binding Issues**
   ```bash
   # Error: VSwitch not found
   # Solution: Verify VSwitch ID exists and is in correct zone
   ```

3. **Lifecycle Policy Errors**
   ```bash
   # Error: Invalid lifecycle rule
   # Solution: Use supported rules (DEFAULT_ATIME_14/30/60/90)
   ```

## Testing

Run tests using:
```bash
cd tests/
terraform init
terraform apply -auto-approve
```

## Contributing

1. Fork the repository
2. Create feature branch
3. Add/update tests
4. Update documentation
5. Submit pull request

## License

MIT License - see LICENSE file for details.