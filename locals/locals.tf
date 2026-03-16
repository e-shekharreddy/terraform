locals {
    instance_name = "${var.name}-${var.environment}"
    instance_type = "t3.micro"
    common_tags = {
         Project = "roboshop"
        Terraform = "true"
    }
    ec2_final_tags = merge(local.common_tags, var.ec2_tags)
    ami_id = "ami-0220d79f3f480ecf5"
}