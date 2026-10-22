module "acm_module" {
  source = "../../../modules/Security/ACM"
  domain_name = var.domain_name
  aws_region = var.aws_region
}