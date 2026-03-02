variable "description" {
  default = ""
}

variable "quota_path" {
  default = ""
}

variable "mounts" {
  description = "A list of access group configurations"
  type = list(object({
    access_group_name = string
    vswitch_id        = string
  }))
  default = []
}