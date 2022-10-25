variable "ami_id" {
  description = "An image to be used to create this instance "
}

variable "iam_profile_bastion" {
  description = "IAM ROLE ATTACHED TO THIS INSTANCE ABOVE"
}

variable "instance_type" {
  default="t3.micro"
  description = "Type of instance to create"
}