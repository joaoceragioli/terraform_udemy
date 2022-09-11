resource "aws_iam_group" "administrators" {
  name = "administrators"
}
resource "aws_iam_group_policy_attachment" "administrators-attach" {
    group = aws_iam_group.administrators.name 
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    
}
resource "aws_iam_user" "admin1" {
    name = "admin1"
}
resource "aws_iam_user" "admin2" {
    name = "admin2"
}
resource "aws_iam_group_membership" "administrators-users" {
    name = "administrators-users"
    users = [ aws_iam_user.admin1.name,aws_iam_user.admin2.name ]
    group = aws_iam_group.administrators.name
}
resource "aws_iam_policy_attachment" "app-attach1" {
    name = "app-attach1"    
    roles = [ aws_iam_role.app-ec2-role.name ]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanStalkWebTier"
}
resource "aws_iam_policy_attachment" "app-attach2" {
    name = "app-attach1"    
    roles = [ aws_iam_role.app-ec2-role.name ]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanStalkMulticontainerDocker"
}
resource "aws_iam_policy_attachment" "app-attach3" {
    name = "app-attach1"    
    roles = [ aws_iam_role.app-ec2-role.name ]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanStalkWorkerTier"
}
resource "aws_iam_policy_attachment" "app-attach3" {
    name = "app-attach1"    
    roles = [ aws_iam_role.app-ec2-role.name ]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanStalkEnhancedHealth"
}