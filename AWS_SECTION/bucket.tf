resource "aws_s3_bucket" "b" {
    bucket = "mybucket-cdawdawdwadwd29df1"
    acl = "private"
    #force_destroy = true

    tags = {
      "Name" = "mybucket-cadwdwadadawdwadas29df1"
    }
}
resource "aws_iam_role_policy" "s3-mybucket-role-policy" {
    name = "s3-mybucket-role-policy"
    role = aws_iam_role.s3-mybucket-role.id
    policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "s3:*"
        ],
        "Resource": [
            "arn:aws:s3:::mybucket-c29df1",
            "arn:aws:s3:::mybucket-c29df1/*"
        ]
    }
 ]
}
EOF
}