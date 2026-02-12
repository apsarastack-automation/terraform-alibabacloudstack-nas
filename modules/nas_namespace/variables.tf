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