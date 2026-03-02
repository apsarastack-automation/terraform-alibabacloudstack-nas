resource "alibabacloudstack_oss_bucket" "lifecycle_bucket" {
  bucket = var.name
  acl    = "private"
}