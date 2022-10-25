variable "vpc_cidr" {
  type = string
  default = "128.10.0.0/18"
  description = "CIDR block for this project"
}

variable "tags_one" {
  type = map(any)
  default = {
    "name" = "aws_subnet_one"
    "key" ="aws_private_subnet"
  }
}
variable "tags_two" {
  type = map(any)
  default = {
    "name" = "aws_subnet_two"
    "key" ="aws_private_subnet"
  }
}


variable "subnet_pr1_cidr" {
  type=string
  default = "128.10.21.0/24"
}
variable "subnet_pr2_cidr" {
  type=string
  default = "128.10.22.0/24"
}


variable "availability_zones_one" {
  type = list
  default = ["eu-south-1b","eu-south-1a"]
}
variable "availability_zones_two" {
  type = list
  default = ["eu-south-1c","eu-south-1a"]
}
variable "subnet_pub1_cidr" {
  type=string
  default = "128.10.23.0/24"
}
variable "subnet_pub2_cidr" {
  type=string
  default = "128.10.24.0/24"
}
variable "ami_id" {
  description = "An image to be used to create this instance "
  default = "ami-03a68febd9b9a5403"
  type = string
}

#variable "iam_profile_bastion" {
 # description = "IAM ROLE ATTACHED TO THIS INSTANCE ABOVE"
#}

variable "instance_type" {
  default="t3.micro"
  description = "Type of instance to create"
}
