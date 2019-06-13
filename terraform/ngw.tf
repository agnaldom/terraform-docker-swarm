# Elastic IP (EIP)
resource "aws_eip" "tuto_eip" {
  vpc        = true
  depends_on = ["aws_internet_gateway.gw"]
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.tuto_eip.id}"
  subnet_id     = "${aws_subnet.subnet_public.id}"
  depends_on    = ["aws_internet_gateway.gw"]
}

# Criando routa privada para routa de internet
resource "aws_route_table" "private_route_table" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  tags = {
    Name = "Private route table"
  }
}

resource "aws_route" "private_route" {
  route_table_id         = "${aws_route_table.private_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}

# Associando tabela de routas
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = "${aws_subnet.subnet_public.id}"
  route_table_id = "${aws_vpc.tf_vpc.main_route_table_id}"
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = "${aws_subnet.subnet_private.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}
