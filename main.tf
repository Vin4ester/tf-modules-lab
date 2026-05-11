provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  subnet1_name       = var.subnet1_name
  subnet1_cidr       = var.subnet1_cidr
  availability_zone1 = var.availability_zone1
  subnet2_name       = var.subnet2_name
  subnet2_cidr       = var.subnet2_cidr
  availability_zone2 = var.availability_zone2
  subnet3_name       = var.subnet3_name
  subnet3_cidr       = var.subnet3_cidr
  availability_zone3 = var.availability_zone3
  internet_gateway   = var.internet_gateway
  routing_table      = var.routing_table
}

module "network_security" {
  source = "./modules/network_security"

  vpc_id                           = module.network.vpc_id
  allowed_ip_range                 = var.allowed_ip_range
  ssh_security_group_name          = var.ssh_security_group_name
  public_http_security_group_name  = var.public_http_security_group_name
  private_http_security_group_name = var.private_http_security_group_name
}

module "application" {
  source = "./modules/application"

  aws_launch_template_name = var.aws_launch_template_name
  aws_asg_name             = var.aws_asg_name
  load_balancer            = var.load_balancer
  vpc_id                   = module.network.vpc_id
  subnet_ids               = module.network.subnet_ids
  ssh_sg_id                = module.network_security.ssh_sg_id
  public_http_sg_id        = module.network_security.public_http_sg_id
  private_http_sg_id       = module.network_security.private_http_sg_id
}
