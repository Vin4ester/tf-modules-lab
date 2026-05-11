output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.network.subnet_ids
}

output "load_balancer_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = module.application.load_balancer_dns
}
