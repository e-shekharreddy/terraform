resource "aws_instance" "roboshop" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]


  tags = {
    Name = "terraform"
    Project = "roboshop"

  }
}

resource "aws_security_group"  "allow_tls" {
  name = "allow-all-trafic" # this is for aws 
  description = "Allow TLS inbound and all outbound traffic"
 

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # here ingress is going to be special variable
  dynamic "ingress" {
    for_each = toset(var.ingress_rules) # set or list or map anything is worked for dynamic
    content{
        from_port        = ingress.value.port
        to_port          = ingress.value.port 
        protocol         = "tcp"
        cidr_blocks      = ingress.value.cidr_blocks
        description = ingress.value.description
    }
  }
  tags = {
    Name = "allow-all-terraform"
  }

}