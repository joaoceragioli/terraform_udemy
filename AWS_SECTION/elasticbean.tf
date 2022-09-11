resource "aws_elastic_beanstalk_application" "app" {
    name = "app"
    description = "app"
}

resource "aws_elastic_beanstalk_environment" "app-prod" {
    name = "app-prod"
    application = aws_elastic_beanstalk_application.app.name
    solution_stack_name = "64bit Amazon Linux 2 v3.4.1 running PHP 8.1"
    setting {
      namespace = "aws:ec2:vpc"
      name = "VPCId"
      value = aws_vpc.main.id
    }
    setting {
      namespace = "aws:ec2:vpc"
      name = "Subnets"
      value = "${aws_subnet.main-private-1.id},${aws_subnet.main-private-2.id}"
    }
    setting {
      namespace = "aws:ec2:vpc"
      name = "AssociatePublicIpAddress"
      value = "false"
    }
    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "app-ec2-role"
    }
    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "SecurityGroups"
      value = aws_security_group.allow-ssh.id
    }
    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "EC2KeyName"
      value = aws_key_pair.key.id
    }
    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "SecurityGroups"
      value = aws_security_group.allow-ssh.id
    }
    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "InstanceType"
      value = "t2.micro"
    }
    setting {
      namespace = "aws:elasticbeanstalk:environment"
      name = "ServiceRole"
      value = "aws-elasticbeanstalk-service-role"
    }
    setting {
      namespace = "aws:ec2:vpc"
      name = "ELBScheme"
      value = "public"
    }
    setting {
      namespace = "aws:ec2:vpc"
      name = "ELBSubnets"
      value = "${aws_subnet.main-public-1},${aws_subnet.main-public-2}"
    }
    setting {
      namespace = "aws:elb:loadbalancer"
      name = "CrossZone"
      value = "true"
    }
    setting {
      namespace = "aws:elasticbeanstalk:command"
      name = "Batchsize"
      value = "30"
    }
    setting {
      namespace = "aws:elasticbeanstalk:command"
      name = "BatchsizeType"
      value = "Percentage"
    }
    setting {
      namespace = "aws:autoscaling:asg"
      name = "Availability Zones"
      value = "Any 2"
    }
    setting {
      namespace = "aws:autoscaling:asg"
      name = "MinSize"
      value = "1"
    }
    setting {
      namespace = "aws:autoscaling:updatepolicy:rollingupdate"
      name = "RollingUpdateType"
      value = "Health"
    }
    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name = "RDS_USERNAME"
      value = aws_db_instance.mariadb.username
    }
    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name = "RDS_PASSWORD"
      value = aws_db_instance.mariadb.password
    }
    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name = "RDS_DATABASE"
      value = aws_db_instance.mariadb.name
    }
        setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name = "RDS_HOSTNAME"
      value = aws_db_instance.mariadb.endpoint
    }
}
