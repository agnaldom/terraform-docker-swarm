provider "aws" {
    region          = "${var.aws_region}"
    access_key  = "${var.aws_access_key_id}"
    secret_key   = "${var.aws_secret_access_key}"
}

module "networking" {
    source           = "./networking"
    vpc_cidr        = "${var.vpc_cidr}"
    vpc_cidr        = "${var.vpc_cidr}"
    availability_zone = "${var.availability_zone}"
    cidr_block_public = "${var.cidr_block_public}"
    cidr_block_private = "${var.cidr_block_private}"
}