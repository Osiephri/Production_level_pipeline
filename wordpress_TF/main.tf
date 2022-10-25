resource "aws_security_group" "private_subnet_1" {
   name="allow_ssh"
   description = "allow ssh anywhere to private_subnet"
   vpc_id = aws_vpc.abayomi_vpc.id
   subnet_id = aws_subnet.private_subnet_one.id
   ingress = [ {
     cidr_blocks = [aws_vpc.abayomi_vpc.cidr_block]
     description = "Allow ssh only in and out of this subnet"
     from_port = 22
     protocol = "SSH"
     to_port = 22
   }
    ]
    egress = [ {
      cidr_blocks = [ aws_vpc.abayomi_vpc.cidr_block]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } ]
}
resource "aws_security_group" "private_subnet_2" {
   name="allow_ssh"
   description = "allow ssh anywhere to private_subnet"
   vpc_id = aws_vpc.abayomi_vpc.id
   subnet_id = aws_subnet.private_subnet_two.id
   ingress = [ {
     cidr_blocks = [aws_vpc.abayomi_vpc.cidr_block]
     description = "Allow ssh only in and out of this subnet"
     from_port = 22
     protocol = "SSH"
     to_port = 22
   }
    ]
    egress = [ {
      cidr_blocks = [ aws_vpc.abayomi_vpc.cidr_block]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } ]
}
resource "aws_security_group" "public_subnet_1" {
   name="allow_http"
   description = "allow http anywhere to private_subnet"
   vpc_id = aws_vpc.abayomi_vpc.id
   subnet_id = aws_subnet.private_subnet_one.id
   ingress = [ {
     cidr_blocks = [aws_vpc.abayomi_vpc.cidr_block]
     description = "Allow ssh only in and out of this subnet"
     from_port = 22
     protocol = "SSH"
     to_port = 22
   },

   #-------------------Second rule---------------------#
   {
    cidr_block=[aws_vpc.abayomi_vpc.cidr_block]
    description = "Allow http only in and out of this subnet"
    from_port=80
    to_port=80
    protocol="http"
   },

   #-------------------Third rule---------------------#
   {
    cidr_block=[aws_vpc.abayomi_vpc.cidr_block]
    description = "Allow Https only in and out of this subnet"
    from_port=443
    to_port=443
    protocol="https"
   }

   #------------------------Egress rule------------------#
    ]
    egress = [ {
      cidr_blocks = [ aws_vpc.abayomi_vpc.cidr_block]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } ]
}
resource "aws_security_group" "public_subnet_2" {
   name="allow_http_https"
   description = "allow http and https anywhere to private_subnet"
   vpc_id = aws_vpc.abayomi_vpc.id
   subnet_id = aws_subnet.private_subnet_two.id
   ingress = [ {
     cidr_blocks = [aws_vpc.abayomi_vpc.cidr_block]
     description = "Allow ssh only in and out of this subnet"
     from_port = 22
     protocol = "SSH"
     to_port = 22
   },

   #-------------------Second rule---------------------#
   {
    cidr_block=[aws_vpc.abayomi_vpc.cidr_block]
    description = "Allow http only in and out of this subnet"
    from_port=80
    to_port=80
    protocol="http"
   },

   #-------------------Third rule---------------------#
   {
    cidr_block=[aws_vpc.abayomi_vpc.cidr_block]
    description = "Allow Https only in and out of this subnet"
    from_port=443
    to_port=443
    protocol="https"
   }

   #------------------------Egress rule------------------#
    ]
    egress = [ {
      cidr_blocks = [ aws_vpc.abayomi_vpc.cidr_block]
      description = "Allow Traffic leaving it reach anywhere"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } ]
}

#--------------------Instances---------------------#
resource "aws_instance" "bastion" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_security_group.public_subnet_1
  iam_instance_profile = "{var.iam_profile_bastion}"
  source_dest_check = false
  associate_public_ip_address = true
}