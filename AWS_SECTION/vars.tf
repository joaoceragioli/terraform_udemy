variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-1"
}
variable "AMIS" {
    type = map(string)
    default = {
        us-east-1 = "ami-05fa00d4c63e32376"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "/home/p00p/.ssh/ec2_terraform"
}
variable "PATH_TO_PUBLIC_KEY" {
    default = "/home/p00p/.ssh/ec2_terraform.pub"
}

variable "INSTANCE_DEVICE_NAME" {}

variable "RDS_PASSWORD" {}