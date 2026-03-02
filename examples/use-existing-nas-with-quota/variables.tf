variable "description" {
  default = ""
}

variable "quota_path" {
  default = "/"
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

variable "nas_file_system_id" {
  description = "Existing file system ID"
  default     = ""
}
