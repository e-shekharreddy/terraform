resource "aws_route53_record" "www" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
#  interpolation
    name    = "${each.key}.${var.domain_name}" 
    type    = "A"
    ttl     = 1
    records = [each.value.private_ip]
    allow_overwrite = true
}

# for frontend
resource "aws_route53_record" "www" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
#  interpolation
    name    = "${each.key}.${var.domain_name}" 
    type    = "A"
    ttl     = 1
    records = [lookuo(aws_instance.roboshop, "frontend").public_ip]
    allow_overwrite = true
}