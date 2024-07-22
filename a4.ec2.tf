resource "aws_instance" "terraform2_instance" {
  ami = data.aws_ami.amznlinux.id
  instance_type = var.instance_type
  #user_data     = file("${path.module}/app1-install.sh")
  ### any resource which accepts multple valu, we should use square bracket or array
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_http.id]
  tags = {
    "name" = "ec2_saideep"
  }

}