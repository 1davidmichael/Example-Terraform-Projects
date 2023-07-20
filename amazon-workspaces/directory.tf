resource "aws_directory_service_directory" "ad_connector" {
  name     = var.directory_name
  password = var.directory_password
  size     = "Small"
  type     = "ADConnector"

  connect_settings {
    customer_dns_ips  = var.directory_dns_ips
    customer_username = var.directory_user
    subnet_ids        = module.vpc.private_subnets
    vpc_id            = module.vpc.vpc_id
  }
}