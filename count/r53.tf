resource "aws_route53_record" "www" {
    count = 10
    zone_id = var.zone_id
#  interpolation
    name    = "${var.instances[count.index]}.${var.domain_name}" 
    type    = "A"
    ttl     = 1
    records = [aws_instance.roboshop[count.index].private_ip]
    
}