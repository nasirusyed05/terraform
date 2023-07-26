provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIARHFQRUESFLZV6TTS"
  secret_key = "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"
  region     = "ap-northeast-1"
}
resource "aws_instance" "linux" {
  ami = "ami-09bad682e5ae72267"
  tags = {
    name = "linux-computer"
  }
  instance_type = "t2.micro"
  count         = 4
  key_name      = "linux-terraform-count"
}

