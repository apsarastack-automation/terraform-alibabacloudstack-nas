run "setup_instance" {
  command = apply
  module {
    source = "./setup_instance/vswitchs"
  }
  variables {
    name = "tftest"
  }
}

run "validate" {
  command = apply
  module {
    source = "../examples/multiple-access-groups"
  }
  variables {
    description = "tftest"
    mounts = [
      {
        access_group_name = "testtf1"
        vswitch_id        = run.setup_instance.vpc_vswitchs[0]
      },
      {
        access_group_name = "testtf2"
        vswitch_id        = run.setup_instance.vpc_vswitchs[1]
      },
      {
        access_group_name = "testtf3"
        vswitch_id        = run.setup_instance.vpc_vswitchs[2]
      },
    ]
  }
}
