resource "aws_instance" "terraform2_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/app1-install.sh")
  ### any resource which accepts multple value, we should use square bracket or array
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_http.id]
  count = 2

  tags = {
    "name" = "ec2_saideep-${count.index}"
  }

}

resource "aws_iam_user" "iamuser" {
  count = 2
  name = "sai-${count.index}"
}