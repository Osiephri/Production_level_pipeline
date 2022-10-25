module "vpc" {
  source= "./modules/vpc/"
  vpc_cidr=var.vpc_cidr
}
module "private_subnet_one" {
  source="./modules/subnets/private"
  vpc_id = module.vpc.vpc_id
  subnet_pr1_cidr=var.subnet_pr1_cidr
  #tags=var.tags_one
  availability_zones_one  = "eu-south-1b"
}
module "private_subnet_two" {
  source="./modules/subnets/private"
  vpc_id = module.vpc.vpc_id
  subnet_pr1_cidr=var.subnet_pr2_cidr
  #tags=var.tags_two
  availability_zones_two =  "eu-south-1c"

}

module "public_subnet_one" {
  source="./modules/subnets/public"
  vpc_id = module.vpc.vpc_id
  subnet_pub1_cidr=var.subnet_pub1_cidr
  #tags=var.tags_one
  availability_zones_one="eu-south-1b"
}
module "public_subnet_two" {
  source="./modules/subnets/public"
  vpc_id = module.vpc.vpc_id
  subnet_pub2_cidr=var.subnet_pub1_cidr
  #tags=var.tags_two
  availability_zones_two="eu-south-1b"
  
}
module "security_groups_PriSub1" {  
  source="./modules/security_groups"
  vpc_id=module.vpc.vpc_id
  #subnet_id_Pri1 = module.private_subnet_one
}
module "security_groups_PriSub2" {
  source="./modules/security_groups"
  vpc_id=module.vpc.vpc_id
  #subnet_id_Pri2 = module.private_subnet_two
}
module "security_groups_PubSub1" {
  source="./modules/security_groups"
  vpc_id=module.vpc.vpc_id
  #subnet_id_Pub1 = module.public_subnet_one
}
module "security_groups_PubSub2" {
  source="./modules/security_groups"
  vpc_id=module.vpc.vpc_id
  #subnet_id_Pub2=module.private_subnet_two
}
module "instance"{
    source="./modules/instance"
    instance_type=var.instance_type
    ami_id=var.ami_id
    subnet_pub1_cidr=var.subnet_pub1_cidr
}