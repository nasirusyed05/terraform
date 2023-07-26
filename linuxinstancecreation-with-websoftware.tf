provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIARHFQRUESFLZV6TTS"
  secret_key = "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"
  region     = "ap-southeast-2"
}
resource "aws_instance" "linux" {
  ami           = "ami-013135cca66fe83c0"
  instance_type = "t2.micro"
  tags = {
    name = "linux"
  }
  key_name        = "terraform-sydney"
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
  user_data       = file("script.sh")
}
resource "aws_security_group" "allow_ssh_http" {
  tags = {
    name = "allow_ssh_http"
  }
  name        = "allow_SSH_HTTP"
  description = "allowssh&http traffic"
  vpc_id      = "vpc-02ee2db1f59b7316c"
  ingress {
    description      = "allow.ssh from vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "allow http from vpc"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


