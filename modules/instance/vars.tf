variable "ami_id" {
  description = "An image to be used to create this instance"
  #default = "ami-03a68febd9b9a5403"
  type = string
}

#variable "iam_profile_bastion" {
 # description = "IAM ROLE ATTACHED TO THIS INSTANCE ABOVE"
#}

variable "instance_type" {
  default="t3.micro"
  description = "Type of instance to create"
}
variable "subnet_pub1_cidr" {
  type=string
  default = "128.0.40.0/24"
}

variable "instancename" {
  type=map(any)
  default = {
    "name" = "Production_server" 
  }
}