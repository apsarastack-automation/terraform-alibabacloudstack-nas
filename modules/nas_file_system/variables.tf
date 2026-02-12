
variable "protocol_type" {
  description = "File transfer protocol type"
  default     = ""
}

variable "storage_type" {
  description = "The storage type"
  default     = ""
}

variable "description" {
  description = "File system description"
}
# Multiple access groups support
variable "mounts" {
  description = "A list of access group configurations"
  type = list(object({
    access_group_name = string
    vswitch_id        = string
  }))
  default = []
}

variable "quota_path" {
  description = "Whether to enable directory quota"
  type        = string
  default     = "/"
}


variable "quotas" {
  description = "A list of quota configurations"
  type = list(object({
    quota_type       = string
    user_type        = string
    user_id          = string
    size_limit       = optional(number)
    file_count_limit = optional(number)
  }))
  default = []
}

# Existing file system ID
variable "nas_file_system_id" {
  description = "Existing file system ID"
  default     = ""
}
