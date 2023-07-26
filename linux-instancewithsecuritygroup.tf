provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIARHFQRUESFLZV6TTS"
  secret_key = "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"
  region     = "ap-southeast-2"
}
resource "aws_instance" "linux" {

  tags = {
    name = "linux-computer"
  }
  ami             = "ami-06c13ede344452248"
  instance_type   = "t2.micro"
  key_name        = "terraform-sydney"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}
resource "aws_security_group" "allow_ssh" {
  tags = {
    name = "ALLOW_SSH"
  }
  name        = "allow_ssh"
  description = "allow ssh traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

