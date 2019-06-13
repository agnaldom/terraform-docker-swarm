data "aws_availability_zones" "available" {}

# VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "dedicated"

  tags = {
    Name = "docker_swarm"
  }
}

# Subnet Public
resource "aws_subnet" "subnet_public" {
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  availability_zone       = "${var.availability_zone}"
  cidr_block              = "${var.cidr_block_public}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "swarm_public"
  }

  depends_on = [
    "aws_vpc.tf_vpc",
  ]
}

# Subnet Privada
resource "aws_subnet" "subnet_private" {
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  availability_zone       = "${var.availability_zone}"
  cidr_block              = "${var.cidr_block_private}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "swarm_private"
  }

  depends_on = [
    "aws_vpc.tf_vpc",
  ]
}
