resource "aws_iam_role" "s3-mybucket-role" {
  name = "s3-mybucket-role"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal":{
            "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
 ]
}
EOF
}
resource "aws_iam_instance_profile" "s3-mybucket-role-instanceprofile" {
    name = "s3-mybucket-role"
    role =  aws_iam_role.s3-mybucket-role.name
  
}
resource "aws_iam_role" "app-ec2-role" {
  name = "app-ec2-role"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal":{
            "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
 ]
}
EOF
}
resource "aws_iam_instance_profile" "app-ec2-role" {
    name = "app-ec2-role"
    role =  aws_iam_role.app-ec2-role.name
  
}
resource "aws_iam_role" "elasticbeanstalk-service-role" {
  name = "elasticbeanstalk-service-role"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal":{
            "Service": "elasticbeanstalk.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
 ]
}
EOF
}