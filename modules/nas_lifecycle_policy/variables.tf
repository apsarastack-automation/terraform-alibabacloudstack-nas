variable "file_system_id" {
  description = "The ID of the file system to apply lifecycle policy"
  type        = string
}

variable "lifecycle_policy_name" {
  description = "Lifecycle policy name"
  type        = string
}

variable "lifecycle_rule_name" {
  description = "Lifecycle rule name (DEFAULT_ATIME_14/30/60/90)"
  type        = string
}

variable "path" {
  description = "Absolute path for lifecycle policy"
  type        = string
  default     = "/"
}

variable "oss_bucket" {
  description = "OSS bucket name for lifecycle policy"
  type        = string
}

variable "recursive" {
  description = "Whether to recursively apply lifecycle policy to sub-paths"
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "The type of storage after the data dump. Default value: InfrequentAccess"
  type        = string
  default     = "InfrequentAccess"
}