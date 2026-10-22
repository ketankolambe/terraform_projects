 output "hostedzone_id" {
  value = aws_route53_zone.main.id
}
 
 output "hosted_zone_id" {

  value = aws_route53_zone.main.zone_id
}


#################################################
# HOSTED ZONE
#################################################

#output "hosted_zone_id" {

  #value = aws_route53_zone.this.zone_id
#}

#output "hosted_zone_arn" {

  #value = aws_route53_zone.this.arn
#}

#output "hosted_zone_name" {

 # value = aws_route53_zone.this.name
#}

#################################################
# NAME SERVERS
#################################################

#output "name_servers" {

 # value = aws_route53_zone.this.name_servers
#}