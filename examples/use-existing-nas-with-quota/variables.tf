variable "description" {
  default = "tftest1"
}

variable "quota_path" {
  default = "/"
}

variable "quotas" {
  default = [
    {
      quota_type       = "Enforcement"
      user_type        = "Uid"
      user_id          = "1001"
      size_limit       = 500
      file_count_limit = 50000
    },
    {
      quota_type       = "Accounting"
      user_type        = "Uid"
      user_id          = "1000"
      size_limit       = 0
      file_count_limit = 0
    }
  ]
}
