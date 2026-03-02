variable "description" {
  description = "Description for the NAS namespace"
  default     = "Managed by Terraform"
}

variable "filesystems" {
  description = "List of filesystem configurations to create and attach to namespace"
  type        = list(string)
  default     = []
}