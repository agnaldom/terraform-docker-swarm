data "aws_availability_zones" "available" {}

resource "aws_vpc" "tf_vpc" {
    cidr_block                   = "${var.vpc_cidr}"
    instance_tenancy = "dedicated"

    tags {
        Name = "docker_swarm"
    }
}