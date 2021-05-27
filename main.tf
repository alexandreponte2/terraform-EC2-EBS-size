provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "who" {
  ami               = "ami-09e67e426f25ce0d7"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  key_name          = var.key_name
  root_block_device {
    volume_type = "gp2"
    volume_size = "15"
  }
  tags = {
    Name = "who"
  }
}
output "dns" {
  value = aws_instance.who.public_dns
}
