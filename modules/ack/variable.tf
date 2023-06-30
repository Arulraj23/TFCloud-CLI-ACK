# resource "alicloud_cs_managed_kubernetes" "kmc_black"

variable "cluster_name" { 
  type = string
}

variable "cluster_version" {
  type = string
  default = "1.24.6-aliyun.1" #----? 1.20.11-aliyunedge.1
}

variable "black_worker_vswitch_ids" { # (Required) The vswitches used by node pool workers.
  type = list(string)
}

variable "black_pod_vswitch_ids" { # (Optional) - [Terway Specific] The vswitches for the pod network when using Terway.Be careful the pod_vswitch_ids can not equal to worker_vswitch_ids or master_vswitch_ids but must be in same availability zones.
  type = list(string)
}

variable "service_cidr" { #(Optional) The CIDR block for the service network. It cannot be duplicated with the VPC CIDR and CIDR used by Kubernetes cluster in VPC, cannot be modified after creation.
  default = "10.10.0.0/16"
}

variable "load_balancer_spec" { #----?
  default = "slb.s1.small"
}

variable "timezone" {
  default = "Asia/Shanghai"
}

#---------------------------------------------------------------------------------------------------------------
/* # resource "alicloud_cs_kubernetes_node_pool" "black_default"


variable "black_instance_types" { # (Required) The instance type of worker node.
  #type = list(string)
  default = "ecs.t5-lc2m1.nano" // 1 vCPU with 0.5 GiB RAM, TODO
}


variable "key_name" { # (Optional) The keypair of ssh login cluster node, you have to create it first. You have to specify one of password key_name kms_encrypted_password fields. Only key_name is supported in the management node pool.
  type = string
}


variable "worker_system_disk_category" { # (Optional) The system disk category of worker node. Its valid value are cloud_ssd, cloud_efficiency and cloud_essd. Default to cloud_efficiency.
  default = "cloud_efficiency"
}

variable "worker_system_disk_size" { #(Optional) The system disk category of worker node. Its valid value range [40~500] in GB. Default to 120.

  type = number
  default = "20" // GiB
}

variable "system_disk_performance_level" { #(Optional) The performance of system disk, only valid for ESSD disk. You have to specify one of PL0 PL1 PL2 PL3 fields.
  default = "PL0"
}

variable "system_disk_encrypted" {  #- (Optional, Available in 1.166.0+) Whether to enable system disk encryption.
  type = bool
  default = false
}

variable "system_disk_kms_key" { # (Optional, Available in 1.166.0+) The kms key id used to encrypt the system disk. It takes effect when system_disk_encrypted is true.
  type = string
  default = ""
}

variable "system_disk_encrypt_algorithm" { #(Optional, Available in 1.166.0+) The encryption Algorithm for Encrypting System Disk. It takes effect when system_disk_encrypted is true. Valid values aes-256 and sm4-128.

  type = string
  default = "aes-256"
}  */


#-----------------------------------------------------------------------------------------------------------------------



/* # scaling_config

variable "nodepool_black_desired_size" {  # optional - node count
  type = number
  default = 1
}

variable "nodepool_black_max_size" {
  type = number
  default = 1
}

# resource "alicloud_cs_autoscaling_config" "black" 

variable "scale_down_enabled" {
  type = bool
  default = true
}  */



#-------------------------------------------------------------------------------------------------------------------------




/* variable "slb_internet_enabled" { # (Optional) Whether to create internet load balancer for API Server. Default to true.
  type    = bool
  default = false
}

variable node_cidr_mask {#  24 means 2^(32-24)-1=255 and the node can run at most 255 pods. default: 24
  default = "24" 
}

variable node_port_range {
  default = "30000-40000"
}

variable "tags" { # (Optional) A Map of tags to assign to the resource. It will be applied for ECS instances finally. Detailed below.
  default = {}
}
 */
