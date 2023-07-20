variable "name" {
  type        = string
  description = "Name to be used on all the resources as identifier"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets inside the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of private subnets inside the VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones where the VPC subnets will be created"
}

variable "aws_cidr_range" {
  type        = string
  description = "CIDR range for AWS"
}

variable "on_prem_range" {
  type        = string
  description = "CIDR range for on-prem"
}

variable "transit_gateway_id" {
  type        = string
  description = "Transit Gateway ID"
}

variable "directory_name" {
  type        = string
  description = "Directory name"
}

variable "directory_user" {
  type        = string
  description = "Directory password"
}
variable "directory_password" {
  type        = string
  description = "Directory password"
}

variable "directory_dns_ips" {
  type        = list(string)
  description = "Directory DNS IPs"
}