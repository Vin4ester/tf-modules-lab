variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "allowed_ip_range" {
  description = "List of IP address ranges allowed for secure access"
  type        = list(string)
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group"
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the public HTTP security group"
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the private HTTP security group"
  type        = string
}
