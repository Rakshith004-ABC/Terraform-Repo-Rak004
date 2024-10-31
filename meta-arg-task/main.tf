resource "aws_instance" "example" {
  count = 3

  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

provider "aws" {
  alias  = "us_west"
  region = "us-west-1"
}
