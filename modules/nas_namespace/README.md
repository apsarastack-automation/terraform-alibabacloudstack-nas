# NAS Namespace Module

## Overview

This module manages Alibaba Cloud NAS namespace resources including filesystems, access groups, and lifecycle policies.

## Features

- Automatic namespace creation with zone auto-detection
- Support for existing namespace integration
- Multiple filesystem creation and attachment
- Access group management with network type support
- Automated mount target creation
- Cross-domain mount orchestration
- Lifecycle policy management

## Usage

```hcl
module "nas_namespace" {
  source = "./modules/nas_namespace"
  
  name        = "my-namespace"
  description = "Example NAS namespace"
  
  filesystems = [
    {
      protocol_type = "NFS"
      storage_type  = "Capacity"
      description   = "example-filesystem"
    }
  ]
  
  accessgroups = [
    {
      access_group_name = "example-access-group"
      access_group_type = "Classic"
    }
  ]
}
```

## Variables

See parent module documentation for complete variable reference.

## Outputs

See parent module documentation for complete output reference.