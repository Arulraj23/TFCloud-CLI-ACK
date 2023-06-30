output "vpc_id" {
  value = "${alicloud_vpc.devtest.id}"
}

output "sg_id" {
  value = "${alicloud_security_group.default. *.id}"
}
