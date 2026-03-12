run "setup_nas_filesystem" {
  command = apply
  module {
    source = "./setup_instance/nas_file_system"
  }
  variables {
    description = "tftest"
  }
}

run "setup_bucket" {
  command = apply
  module {
    source = "./setup_instance/oss_bucket"
  }
  variables {
    name = "tftest"
  }
}

run "validate" {
  command = apply
  module {
    source = "../examples/namespace-with-lifecycle"
  }
  variables {
    file_system_id   = run.setup_nas_filesystem.file_system_id
    lifecycle_bucket = run.setup_bucket.bucket_name
    recursive        = true
    name             = "tftest"
  }
}
