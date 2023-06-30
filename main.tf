module "my_vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  project_name=  "dev-module-demo"
}

module "my_vswitch" {
  source = "./modules/vswitchs"
  vpc_id      = module.my_vpc.vpc_id
  vswitch_cidr  = "10.0.1.0/24"
  project_name = "dev-module-demo"
}

module "data" {
  source = "./modules/data"
  vpc_id                     = module.my_vpc.vpc_id
  black_cpu                  = 1
  black_memory               = 1
  zone                       = "cn-shanghai-l" 
  black_instance_type_family = "ecs.n2.small"
  black_vswitch_ids          = [module.my_vswitch.vswitch_id]
}

module "dev_ack_black" {
  source                      = "./modules/ack"
  cluster_name                = "devtest"
  black_worker_vswitch_ids    = module.data.black_vswitches.*.id
  black_pod_vswitch_ids       = module.data.black_vswitches.*.id
  #black_instance_types        = module.data.black_instance_types.*.id
  /* nodepool_black_desired_size = 1
  nodepool_black_max_size     = 2 */
}