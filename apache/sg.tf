resource "aws_security_group" "apache-sg" {
    name        = "${var.sg-name}"
    description = "${var.sg-description}"
    vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "apache-sg-ingress-rules-1" {
    security_group_id = "${aws_security_group.apache-sg.id}"
    type              = "ingress"
    from_port         = "22"
    to_port           = "22"
    protocol          = "TCP"
    cidr_blocks       = [
        "${var.publicip}"
        ]
}

resource "aws_security_group_rule" "apache-sg-ingress-rules-2" {
    security_group_id = "${aws_security_group.apache-sg.id}"
    type              = "ingress"
    from_port         = "80"
    to_port           = "80"
    protocol          = "TCP"
    cidr_blocks       = [
        "${var.publicip}"
        ]
}

resource "aws_security_group_rule" "apache-sg-ingress-rules-3" {
    security_group_id = "${aws_security_group.apache-sg.id}"
    type              = "ingress"
    from_port         = "443"
    to_port           = "443"
    protocol          = "TCP"
    cidr_blocks       = [
        "${var.publicip}"
        ]
}

resource "aws_security_group_rule" "apache-sg-egress" {
  security_group_id = "${aws_security_group.apache-sg.id}"
  type              = "egress"

  cidr_blocks      = ["${var.egress_cidr_blocks}"]

  from_port = "0"
  to_port   = "0"
  protocol  = "-1"
}
