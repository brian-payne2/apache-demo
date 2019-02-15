resource "aws_iam_role" "apache_role" {
  name = "${var.apache-iam-role-name}"
  description = "Managed by Terraform"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      created-by  = "terraform"
  }
}

data "aws_iam_policy" "ssm_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role_policy_attachment" "apache_role_attach" {
  role       = "${aws_iam_role.apache_role.name}"
  policy_arn = "${data.aws_iam_policy.ssm_policy.arn}"
}

resource "aws_iam_instance_profile" "apache-ec2-instance-profile" {
  name = "${var.ec2-instance-profile}"
  role = "${aws_iam_role.apache_role.name}"
}
