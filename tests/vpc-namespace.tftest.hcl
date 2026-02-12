run "validate" {
  command = apply
  module {
    source = "../examples/vpc-namespace"
  }
  variables {
  }
}