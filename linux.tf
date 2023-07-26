provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIARHFQRUESFLZV6TTS"
  secret_key = "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"
  region     = "ap-northeast-1"
}
resource "aws_instance" "linux" {
  ami = "ami-0947c48ae0aaf6781"
  tags = {
    name = "linux-computer"
  }
  instance_type = "t2.micro"
  key_name      = "linux-terra"
}
resource "aws_security_group" "allow_ssh" {
  tags = {
    name = "Allow_SSH"
  }
  description = "allow ssh traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


