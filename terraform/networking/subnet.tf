# Subnet Public
resource "aws_subnet" "subnet_public" {
    vpc_id = "${aws_vpc.tf_vpc.id}"
    availability_zone = "${var.availability_zone}"
    cidr_block = "${var.cidr_block_public}"

    tags {
        Name = "swarm_public"
    }
}

# Subnet Privada
resource "aws_subnet" "subnet_private" {
    vpc_id = "${aws_vpc.tf_vpc.id}"
    availability_zone = "${var.availability_zone}"
    cidr_block = "${var.cidr_block_private}"

    tags {
        Name = "swarm_private"
    }
}