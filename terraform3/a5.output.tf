/*output "instance_publicip" {
  description = "instance ip"
  value = aws_instance.terraform2_instance.public_ip
}*/


output "ins_ava" {
  value = data.aws_ec2_instance_type_offering.inst_type.instance_type
}