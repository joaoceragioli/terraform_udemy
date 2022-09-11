resource "aws_security_group" "allow-ssh" {
    vpc_id = aws_vpc.main.id
    name = "allow-ssh"
    description = "security group that allows ssh and all egress traffic"
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }
    ingress {
      cidr_blocks = [ "177.141.128.243/32" ]
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }
    ingress {
      from_port = 80
      protocol = "tcp"
      to_port = 80
      security_groups = [ aws_security_group.elb-securitygroup.id ]
    }

}
resource "aws_security_group" "allow-mariadb" {
    vpc_id = aws_vpc.main.id
    name = "allow-mariadb"
    description = "security group that allows mariadb"
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }
    ingress {
      from_port = 3306
      protocol = "tcp"
      to_port = 3306
      security_groups = [ aws_security_group.allow-ssh.id ]
    }
    tags = {
      "Name" = "allow-mariadb"
    }
}

resource "aws_security_group" "elb-securitygroup" {
    vpc_id = aws_vpc.main.id
    name = "elb-securitygroup"
    description = "security group that allows elb"
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }
    ingress {
      from_port = 80
      protocol = "tcp"
      to_port = 80
      cidr_blocks = [ "177.141.128.243/32" ]
    }
    tags = {
      "Name" = "elb-securitygroup"
    }
}