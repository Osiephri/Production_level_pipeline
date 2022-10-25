resource "aws_security_group" "private_subnet_1" {
   name="one"
   description = "allow ssh anywhere to private_subnet"
   vpc_id = var.vpc_id
   #subnet_id = var.subnet_id_Pri1
   ingress = [ {
     cidr_blocks = ["128.10.21.0/24"]
     description = "Allow ssh only in and out of this subnet through ports 1337"
     from_port = 1337
     protocol = "tcp"
     to_port = 1337
     ipv6_cidr_blocks= ["::/0"]
     prefix_list_ids = []
     security_groups = []
     self = false
   }
    ]
    egress = [ {
      cidr_blocks = ["128.10.21.0/24"]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
      ipv6_cidr_blocks= ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    } ]
}
resource "aws_security_group" "private_subnet_2" {
   name="two"
   description = "allow ssh anywhere to private_subnet"
   vpc_id = var.vpc_id
   #subnet_id = var.subnet_id_Pri2
   ingress = [ {
     cidr_blocks = ["128.10.22.0/24"]
     description = "Allow ssh only in and out of this subnet"
     from_port = 22
     protocol = "tcp"
     to_port = 22
     ipv6_cidr_blocks= ["::/0"]
     prefix_list_ids = []
     security_groups = []
     self = false
   }
    ]
    egress = [ {
      cidr_blocks = ["128.10.22.0/24"]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
      ipv6_cidr_blocks= ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    } ]
}
resource "aws_security_group" "public_subnet_1" {
   name="three"
   description = "allow http anywhere to private_subnet"
   vpc_id = var.vpc_id
   #subnet_id = var.subnet_id_Pub1
   ingress {
     cidr_blocks = ["128.10.23.0/24"]
     description = "Allow ssh only in and out of this subnet"
     from_port = 80
     protocol = "tcp"
     to_port = 80
     ipv6_cidr_blocks= ["::/0"]
     prefix_list_ids = []
     security_groups = []
     self = false
   }
   #-------------------Second rule---------------------#
  # ingress = [{
   # cidr_blocks=["128.0.40.0/24"]
   # description = "Allow http only in and out of this subnet"
   # from_port=80
   # to_port=80
   # protocol="http"
   # ipv6_cidr_blocks= ["::/0"]
   # prefix_list_ids = []
   # security_groups = []
   # self = false
   #}]

   #-------------------Third rule---------------------#
   #ingress = [{
   # cidr_blocks=["128.0.40.0/24"]
   # description = "Allow Https only in and out of this subnet"
   # from_port=443
   # to_port=443
   # protocol="https"
   # ipv6_cidr_blocks= ["::/0"]
   # prefix_list_ids = []
   # security_groups = []
   # self = false
   #}]

   #------------------------Egress rule------------------#
    
    egress {
      cidr_blocks = ["128.0.23.0/24"]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
      ipv6_cidr_blocks= ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    } 
}
resource "aws_security_group" "public_subnet_2" {
   name="four"
   description = "allow http and https anywhere to private_subnet"
   vpc_id = var.vpc_id
   #subnet_id = var.subnet_id_Pub2
   ingress {
     cidr_blocks = ["128.10.24.0/24"]
     description = "Allow ssh only in and out of this subnet"
     from_port = 80
     protocol = "tcp"
     to_port = 80
     ipv6_cidr_blocks= ["::/0"]
     prefix_list_ids = []
     security_groups = []
     self = false
   }

   #-------------------Second rule---------------------#
   #ingress {
   # cidr_blocks=["128.0.50.0/24"]
   # description = "Allow http only in and out of this subnet"
   # from_port=80
   # to_port=80
   # protocol="http"
   # ipv6_cidr_blocks= ["::/0"]
   # prefix_list_ids = []
   # security_groups = []
   # self = false
   #}

   #-------------------Third rule---------------------#
   # {
   # cidr_blocks=["128.0.50.0/24"]
   # description = "Allow Https only in and out of this subnet"
   # from_port=443
   # to_port=443
   # protocol="https"
   # ipv6_cidr_blocks= ["::/0"]
   # prefix_list_ids = []
   # security_groups = []
   # self = false
   #}

   #------------------------Egress rule------------------#
    
    egress {
      cidr_blocks = ["128.10.24.0/24"]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
      ipv6_cidr_blocks= ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    } 
}