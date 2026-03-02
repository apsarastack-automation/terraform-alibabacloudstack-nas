run "setup_instance" {
  command = apply
  module {
    source = "./setup_instance/vswitchs"
  }
  variables {
    name      = "tftest"
    vsw_count = 2
  }
}

run "validate" {
  command = apply
  module {
    source = "../examples/vpc-namespace"
  }
  variables {
    description = "testtf"
    accessgroups = [
      {
        access_group_name = "tf-access-group1"
        vswitch_id        = run.setup_instance.vpc_vswitchs[0]
        mapped_path       = "test1"
      },
      {
        access_group_name = "tf-access-group2"
        vswitch_id        = run.setup_instance.vpc_vswitchs[1]
        mapped_path       = "test2"
      }
    ]
  }
}
