run "setup_nas_filesystem" {
  command = apply
  module {
    source = "./setup_instance/nas_file_system"
  }
  variables {
    description = "tftest"
  }
}

run "validate" {
  command = apply
  module {
    source = "../examples/use-existing-nas-with-quota"
  }
  variables {
    description = "tftest"
    file_system_id = run.setup_nas_filesystem.file_system_id
    quotas = [
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
}
