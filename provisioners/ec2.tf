resource "aws_instance" "roboshop" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

# self is the special variable
provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
}

provisioner "local-exec" {
  command = "exit-1"
  on_failure = continue
}

provisioner "local-exec" {
    when    = destroy
    command = "echo 'deleting instance'"
}

provisioner "local-exec" {
    when    = destroy
    command = "echo > inventory.ini"
}
connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
}
 provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx"
    ]
    when = destroy 
  }
  tags = {
    Name = "terraform-remote-state-provisioners"
    Project = "roboshop"

  }
}


resource "aws_security_group"  "allow_tls" {
  name = "allow-all-trafic-terra-remote-state" # this is for aws 
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