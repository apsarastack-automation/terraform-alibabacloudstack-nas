variable "description" {
  default = ""
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