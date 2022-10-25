resource "aws_vpc" "abayomi_vpc"{
    cidr_block = "128.1.0.0/18"
    enable_dns_hostnames = true
}
resource "aws_subnet" "private_subnet_one" {
    vpc_id = aws_vpc.abayomi_vpc.id
    cidr_block="128.1.20.0/24"
    tags{
        name="aws_subnet_one"
        key="aws_private_subnet"
    }
    availability_zones = ["eu-south-1b","eu-south-1a"]

}
resource "aws_subnet" "private_subnet_two" {
    vpc_id = aws_vpc.abayomi_vpc.id
    cidr_block="128.1.30.0/24"
    tags{
        name="aws_subnet_two"
        key="aws_private_subnet"
    }
    availability_zones = ["eu-south-1b","eu-south-1a"]

}
resource "aws_subnet" "public_subnet_one" {
    vpc_id = aws_vpc.obus_vpc.id
    cidr_block="128.1.40.0/24"
    tags{
        name="aws_subnet_one"
        key="aws_public_subnet"
    }
    availability_zones = ["eu-south-1b","eu-south-1a"]

}
resource "aws_subnet" "public_subnet_one" {
    vpc_id = aws_vpc.obus_vpc.id
    cidr_block="128.1.40.0/24"
    tags{
        name="aws_subnet_one"
        key="aws_public_subnet"
    }
    availability_zones = ["eu-south-1b","eu-south-1a"]

}
resource "aws_subnet" "public_subnet_two" {
    vpc_id = aws_vpc.obus_vpc.id
    cidr_block="128.1.50.0/24"
    tags{
        name="aws_subnet_two"
        key="aws_public_subnet"
    }
    availability_zones = ["eu-south-1c","eu-south-1a"]

}


resource "aws_route_table" "public_route" {
  route = [ {
    internet_gateway_id = "internet_gateway.obus.id"
    cidr_block = "128.0.0/18"
    subnet_id = [aws_subnet.public_subnet_one.id , aws_subnet.public_subnet_two.id]
  } ]
  
}
resource "aws_route_table_association" "publicroutes" {
    subnet_id = [aws_subnet.public_subnet_one.id , aws_subnet.public_subnet_two.id]
}
variable "nat_gateway" {
  default = "nat_gateway"
  description = "Creates a nat gateway and attaches it to the private hosts"
}

resource "aws_instance" "bastion" {
   ami = ""
   subnet_id = aws_subnet.public_subnet_one.id
   source_dest_check = false
   iam_instance_profile = ""
   associate_public_ip_address = true
}