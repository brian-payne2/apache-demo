output "instance_ips" {
  value = ["${aws_instance.apache-ec2.*.public_ip}"]
}
