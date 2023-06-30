#https://www.alibabacloud.com/help/en/container-service-for-kubernetes/latest/terraform-overview#section-d7a-kn2-sui
#https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_managed_kubernetes?spm=a2c63.p38356.0.0.226654fabTJPvk
locals {
  ack_addons = [
    {
      "name" : "terway-eniip",
      "config" :"IPVlan\":\"false\",\"NetworkPolicy\":\"true\",\"ENITrunking\":\"false\"}"
    },
  ]
}

resource "alicloud_cs_managed_kubernetes" "black" {
  name                 = "ack-${var.cluster_name}-kmc-black-shanghai"
  version              = var.cluster_version
  cluster_spec         = "ack.pro.small" #
  worker_vswitch_ids   = var.black_worker_vswitch_ids #
  pod_vswitch_ids      = var.black_pod_vswitch_ids #
  service_cidr         = var.service_cidr #
  new_nat_gateway      = false # (Optional) Whether to create a new nat gateway while creating kubernetes cluster. Default to true. Then openapi in Alibaba Cloud are not all on intranet, So turn this option on is a good choice.

  load_balancer_spec   = var.load_balancer_spec #
  timezone             = var.timezone #

  dynamic "addons" {
    for_each = local.ack_addons
    content {
      name   = lookup(addons.value, "name", local.ack_addons)
      config = lookup(addons.value, "config", local.ack_addons)
    }
  }

  lifecycle {
    ignore_changes = [load_balancer_spec]
  }
}
/* 
resource "alicloud_cs_kubernetes_node_pool" "black_default" {
  name           = "default" # (Required) The name of node pool.

  cluster_id     = alicloud_cs_managed_kubernetes.black.id # (Required) The id of kubernetes cluster.
  vswitch_ids    = var.black_worker_vswitch_ids 
  instance_types = var.black_instance_types 
  #desired_size   = var.nodepool_black_desired_size

  key_name       = var.key_name

  system_disk_category          = var.worker_system_disk_category
  system_disk_size              = var.worker_system_disk_size 
  system_disk_performance_level = var.system_disk_performance_level
  system_disk_encrypted         = var.system_disk_encrypted
  system_disk_kms_key           = var.system_disk_kms_key
  system_disk_encrypt_algorithm = var.system_disk_encrypt_algorithm

  #user_data                     = var.user_data

  scaling_config {
    min_size = var.nodepool_black_desired_size
    max_size = var.nodepool_black_max_size
    type     = "cpu" # default
  }

  depends_on = [alicloud_cs_autoscaling_config.black]
}

resource "alicloud_cs_autoscaling_config" "black" {
  cluster_id = alicloud_cs_managed_kubernetes.black.id
  cool_down_duration        = "10m"
  unneeded_duration         = "10m" #(Optional) The unneeded duration. Default is 10m.
  utilization_threshold     = "0.5" #  (Optional) The scale-in threshold. Default is 0.5.
  gpu_utilization_threshold = "0.5" # (Optional) The scale-in threshold for GPU instance. Default is 0.5.
  scan_interval             = "30s" #  (Optional) The interval at which the cluster is reevaluated for scaling. Default is 30s.
  scale_down_enabled        = var.scale_down_enabled #  (Optional) Specify whether to allow the scale-in of nodes. Default is true.
  expander                  = "least-waste" #Optional) The policy for selecting which node pool to scale. Valid values: least-waste, random, priority. For more information on these policies,
} */
