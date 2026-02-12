run "validate" {
  command = apply
  module {
    source = "../examples/namespace-with-lifecycle"
  }
  variables {
  }
}