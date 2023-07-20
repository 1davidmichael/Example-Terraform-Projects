module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
}

resource "aws_ec2_transit_gateway_vpc_attachment" "example" {
  subnet_ids         = module.vpc.private_subnets
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = module.vpc.vpc_id
}

resource "aws_route" "tgw_route_on_prem" {
  for_each               = toset(module.vpc.private_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = var.on_prem_range
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "tgw_route_aws" {
  for_each               = toset(module.vpc.private_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = var.aws_cidr_range
  transit_gateway_id     = var.transit_gateway_id
}

