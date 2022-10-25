variable "vpc_id" {
  type = string
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
variable "availability_zones_one" {
  default = "eu-south-1b"
}
variable "availability_zones_two" {
  default = "eu-south-1c"
}
variable "subnet_pr1_cidr" {
  type = list(string)
  default = ["128.10.21.0/24"]
}
variable "subnet_pr2_cidr" {
  default = "128.10.22.0/24"
}
