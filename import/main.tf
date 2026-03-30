resource "aws_instance" "import_demo" {
  ami = "ami-0220d79f3f480ecf5"
  security_groups = [
    "allow all"
  ]
  instance_type = "t3.micro"
  tags = {
    Name = "import"
  }
  subnet_id = "subnet-046cf30f2a124274f"

  vpc_security_group_ids = [
    "sg-078ee4211bd66ef16"
  ]

}