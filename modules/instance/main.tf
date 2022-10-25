#--------------------Instances---------------------#
resource "aws_instance" "bastion" {
  ami = var.ami_id
  instance_type = var.instance_type
  #subnet_cidr = var.subnet_pub1_cidr
  #iam_instance_profile = "{var.iam_profile_bastion}"
  source_dest_check = false
  associate_public_ip_address = true
  tags = var.instancename
}