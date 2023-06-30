variable vpc_id {
  type = string
}

variable "black_vswitch_ids" {
  type = list(any)
}
variable "black_cpu" {
  type = number
}

variable "black_memory" {
  type = number
}


variable "zone" {
  type = string
}

variable "black_instance_type_family" {
  type = string
}