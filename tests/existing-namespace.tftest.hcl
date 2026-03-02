run "setup_instance" {
  command = apply
  module {
    source = "./setup_instance/nas_namespace"
  }
  variables {
    description = "tftest"
  }
}

run "validate" {
  command = apply
  module {
    source = "../examples/existing-namespace"
  }
  variables {
    description = "testnas"
    filesystems = ["test1", "test2"]
    nas_namespace_id = run.setup_instance.nas_namespace_id
    accessgroups = [
    {
      access_group_name = "tf-access-group1"
      vswitch_id        = ""
      mapped_path       = "test1"
    },
    {
      access_group_name = "tf-access-group2"
      vswitch_id        = ""
      mapped_path       = "test2"
    }
  ]
  }
}
