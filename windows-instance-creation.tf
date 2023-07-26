provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIARHFQRUESFLZV6TTS"
  secret_key = "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"
  region     = "ap-northeast-1"
}
resource "aws_instance" "windows" {
  ami = "ami-0d52744d6551d851e"
  tags = {
    name = "windows-computer"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-windows-tokyo"
}
resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "allow rdp traffic"
  ingress {
    from_port   = 3389 #bydefault, the window server listens to tcp port 3389 for RDP
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

