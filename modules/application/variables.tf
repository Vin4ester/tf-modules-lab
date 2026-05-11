variable "aws_launch_template_name" {
  description = "Name of the Launch Template"
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "load_balancer" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ASG and ALB"
  type        = list(string)
}

variable "ssh_sg_id" {
  description = "ID of the SSH security group"
  type        = string
}

variable "public_http_sg_id" {
  description = "ID of the public HTTP security group"
  type        = string
}

variable "private_http_sg_id" {
  description = "ID of the private HTTP security group"
  type        = string
}
