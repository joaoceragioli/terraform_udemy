provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami     = "ami-05fa00d4c63e32376"
    instance_type = "t2.micro"
}