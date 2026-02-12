variable "description" {
  description = "Description for the NAS namespace"
  default     = "Managed by Terraform"
}

variable "nas_namespace_id" {
  description = "Existing NAS namespace ID. If provided, will use existing namespace instead of creating new one"
  default     = ""
}

variable "filesystems" {
  description = "List of filesystem configurations to create and attach to namespace"
  type        = list(string)
  default     = []
}

variable "accessgroups" {
  description = "List of access group configurations"
  type = list(object({
    access_group_name = string
    mapped_path       = string  # Namespace mapped path
    vswitch_id        = optional(string, "")
  }))
  default = []
}

variable "lifecycle_policy_name" {
  description = "Lifecycle policy name"
  default     = ""
}

variable "lifecycle_rule_name" {
  description = "Lifecycle rule name (DEFAULT_ATIME_14/30/60/90)"
  default     = ""
}

variable "path" {
  description = "Absolute path for lifecycle policy"
  default     = "/"
}

variable "oss_bucket" {
  description = "OSS bucket name for lifecycle policy"
  default     = ""
}

variable "recursive" {
  description = "Whether to recursively apply lifecycle policy to sub-paths"
  type        = bool
  default     = false
}
