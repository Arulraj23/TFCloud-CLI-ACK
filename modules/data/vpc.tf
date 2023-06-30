data "alicloud_vpcs" "devtest" {
  ids = [var.vpc_id]
}

output "vpc" {
  value = data.alicloud_vpcs.devtest.vpcs[0]
}


data "alicloud_vswitches" "devtest_black" {
  ids = var.black_vswitch_ids
}

output "black_vswitches" {
  value = data.alicloud_vswitches.devtest_black.vswitches
}



/* 
data "alicloud_nat_gateways" "devtest" { # need to change
  vpc_id = data.alicloud_vpcs.devtest.ids[0]
}

output "natgw" {
  value = data.alicloud_nat_gateways.devtest.gateways # need to change
} */

/* 
data "alicloud_instance_types" "black_instance_types" {
  availability_zone    = var.zone
  cpu_core_count       = var.black_cpu
  memory_size          = var.black_memory
  instance_type_family = var.black_instance_type_family
  kubernetes_node_role = "Worker"
}

output "black_instance_types" {
  value = data.alicloud_instance_types.black_instance_types.instance_types
} */
