module "s3_module" {
  source = "../../../../modules/Storage/S3"
  bucket_name = var.bucket_name
  environment = var.environment
}

module "Cloudfront_module" {

  source = "../../../../modules/Storage/Cloudfront"

  bucket_name                  = module.s3_module.bucket_name
  bucket_arn                   = module.s3_module.bucket_arn
  bucket_regional_domain_name  = module.s3_module.bucket_regional_domain_name

  aliases = [var.frontend_domain]

  aws_region = var.aws_region

  aws_s3_bucket_versioning = var.aws_s3_bucket_versioning
  aws_s3_bucket_acl        = var.aws_s3_bucket_acl

  acm_certificate_arn = "arn:aws:acm:us-east-1:736461510879:certificate/08d7a005-84ea-4a4a-bc85-2c2213dbbf39"

  environment = var.environment
}


############################################################
# Route53
############################################################

resource "aws_route53_record" "frontend" {

  zone_id = data.terraform_remote_state.dns.outputs.hosted_zone_id

  name = var.frontend_domain

  type = "A"

  alias {

    name = module.Cloudfront_module.distribution_domain_name

    zone_id = module.Cloudfront_module.hosted_zone_id

    evaluate_target_health = false

  }

}