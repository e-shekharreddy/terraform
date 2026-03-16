resource "aws_instance" "roboshop" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]


  tags = {
    Name =  local.instance_name
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
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow-all-terraform"
  }

}