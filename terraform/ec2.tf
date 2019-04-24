resource "aws_instance" "apache-ec2" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = [
    "${aws_security_group.apache-sg.id}"
  ]
  iam_instance_profile   = "${aws_iam_instance_profile.apache-ec2-instance-profile.id}"
}
