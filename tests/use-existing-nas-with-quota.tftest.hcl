run "validate" {
  command = apply
  module {
    source = "../examples/use-existing-nas-with-quota"
  }
  variables {
    # instance_name = 
    # instance_type = 
    # table_schemas = 
    # attach_vpc = 
  }
}