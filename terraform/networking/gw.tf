# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id =  "${aws_vpc.tf_vpc.id}"

  tags = {
    Name = "swarm-gw"
  }
}

resource "aws_route" "internet_access" {
    route_table_id         = "${aws_vpc.tf_vpc.main_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = "${aws_internet_gateway.gw.id}"
}