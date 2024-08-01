# Fetch all availability zones that do not require opt-in
data "aws_availability_zones" "my_zones" {
  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Fetch the instance type offering in each availability zone
data "aws_ec2_instance_type_offerings" "inst_type" {
  for_each = toset(data.aws_availability_zones.my_zones.names)
  filter {
    name = "instance-type"
    values = ["t3.large"]
  }
  filter {
    name = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}

# Output all availability zones
output "o1" {
  value = data.aws_availability_zones.my_zones.names
}

output "k" {
  value = data.aws_ec2_instance_type_offerings.inst_type
}


#above output displays the all those az available

output "o2" {
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.inst_type:
    az => details.instance_types if length(details.instance_types) != 0
  }
}

output "o3" {
  value = keys({
    for az,details in data.aws_ec2_instance_type_offerings.inst_type:
    az => details.instance_types if length(details.instance_types) != 0
  })
}



#above output displays the only those az which supports my instance