run "validate" {
  command = apply
  module {
    source = "../examples/basic-namespace"
  }
  variables {
    description = "tftest"
    filesystems = ["test1", "test2"]
  }
}