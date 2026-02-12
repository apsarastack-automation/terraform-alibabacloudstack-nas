run "validate" {
  command = apply
  module {
    source = "../examples/existing-namespace"
  }
  variables {
  }
}