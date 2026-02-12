variable "protocol_type" {
  description = "File transfer protocol type. Valid values: NFS, SMB, cpfs"
  default     = "NFS"
}

variable "storage_type" {
  description = "The storage type. For standard: Performance, Capacity, Premium. For extreme: standard, advance"
  default     = "Capacity"
}

variable "description" {
  description = "File system description"
  default     = "Managed by Terraform"
}


# Mount target variables
variable "mounts" {
  description = "A list of access group configurations"
  type = list(object({
    access_group_name = string
    vswitch_id = string
  }))
  default = []
}

variable "quota_path" {
  description = "The absolute path of the directory for quota"
  default     = "/"
}

variable "quotas" {
  description = "A list of quota configurations"
  default = []
}

# Existing file system ID
variable "nas_file_system_id" {
  description = "Existing file system ID. If provided, will not create new file system"
  default     = ""
}