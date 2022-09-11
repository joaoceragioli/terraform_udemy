resource "aws_key_pair" "key" {
    key_name = "mykey"
    public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
    ami     = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"

  #VPC SUubnet
  subnet_id = aws_subnet.main-public-1.id

  #Security Group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  #The public SSH Key
  key_name = aws_key_pair.key.key_name

  #User data
  user_data = data.template_cloudinit_config.cloudinit-example.rendered

  iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size = 20
  type = "gp2"
  tags = {
    "Name" = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = var.INSTANCE_DEVICE_NAME
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example.id
}

output "ip" {
  value = "${aws_instance.example.public_ip}"
}