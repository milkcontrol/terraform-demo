module "vpc" {
  source = "../../module/vpc"
  vpc_name = var.vpc_name
}

module "ec2" {
  source = "../../module/ec2"
  production_name = var.production_name
  enviroment = var.enviroment
  vpc_id = module.vpc.vpc_id
  subnet_public_a_id = module.vpc.subnet_public_a_id
  subnet_public_c_id = module.vpc.subnet_public_c_id
  subnet_public_d_id = module.vpc.subnet_public_d_id
}

