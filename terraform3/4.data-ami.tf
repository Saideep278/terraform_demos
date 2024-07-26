data "aws_ec2_instance_type_offering" "inst_type" {
  filter {
    name = "instance-type"
    values = [ "t2.micro" ]
  }

  filter {
    name = "location"
    values = ["us-east-1e"]
    #values = ["us-east-1a"]
  }

  location_type = "availability-zone"
}
