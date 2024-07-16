#terrafrom setting block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 5.0"
      # required in production level
    }
  }
}



# provider block
provider "aws" {
  region = "us-east-1"
}


# resource block
resource "aws_instance" "demo_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  tags = {
    "name" = "terraform_server"
  }
}

