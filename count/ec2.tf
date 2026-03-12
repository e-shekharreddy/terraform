resource "aws_instance" "roboshop" {
  count = 10
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]


  tags = {
    Name = var.instances[count.index]
    Project = "roboshop"

  }
}

resource "aws_security_group"  "allow_tls" {
  name = "allow-all-roboshop" # this is for aws 
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