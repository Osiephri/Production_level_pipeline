resource "aws_subnet" "private_subnet_one" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_pr1_cidr
    tags = var.tags_one
    availability_zone = "eu-south-1b"

}
resource "aws_subnet" "private_subnet_two" {
    vpc_id = var.vpc_id
    cidr_block=var.subnet_pr2_cidr
    tags=var.tags_two
    availability_zone = "eu-south-1c"
}