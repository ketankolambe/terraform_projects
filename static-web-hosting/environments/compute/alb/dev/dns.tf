# # Reference your existing Route 53 Hosted Zone
# data "aws_route53_zone" "primary" {
#   name         = "ketankolambe.online"
#   private_zone = false
# }

# resource "aws_route53_record" "alb" {
#   zone_id = data.aws_route53_zone.primary.zone_id
#   name    = "www.ketankolambe.online"
#   type    = "A"

#   alias {
#     name                   = data.terraform_remote_state.tg_backend.outputs.alb_dns_name

#     zone_id                = data.terraform_remote_state.tg_backend.outputs.alb_zone_id
#     evaluate_target_health = true
#   }
# }