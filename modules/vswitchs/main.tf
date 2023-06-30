

/* resource "alicloud_vswitch" "main" {
  # VPC ID
  vpc_id            = alicloud_vpc.main.id
  # CIDR block of the VSwitch
  cidr_block        = "10.1.0.0/24"
  # Dependent resource (this dependent resource will be created first)
  zone_id = "cn-shanghai-a"
  depends_on = [alicloud_vpc.main]
} */

resource "alicloud_vswitch" "devtest_black" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.vswitch_cidr}"
  zone_id = "cn-shanghai-a"
  #depends_on = [alicloud_vpc.devtest]

  tags = {
    Name = "${var.project_name}-vswitch"
  }
}