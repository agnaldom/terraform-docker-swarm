##Create swarm security group
resource "aws_security_group" "elb_external" {
  name        = "sg_elb_external"
  vpc_id      = "${aws_vpc.tf_vpc.id}"
  description = "Allows traffic from and to the EC2 instances of the sg-elb-external Docker Swarm ELB from outside"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "sg-elb-external"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "swarm_cluster" {
  name        = "sg_swarm_cluster"
  vpc_id      = "${aws_vpc.tf_vpc.id}"
  description = "Allows traffic from and to the EC2 instances of the sg-swarm-cluster Docker Swarm Cluster"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${aws_vpc.tf_vpc.cidr_block}"]
  }

  ingress {
    from_port = 44554
    to_port   = 44554
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.elb_external.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "sg-swarm-cluster"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "swarm_sg" {
  name        = "swarm_sg_manager"
  description = "Allow all inbound traffic necessary for Swarm"
  vpc_id      = "${aws_vpc.tf_vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2377
    to_port     = 2377
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 4789
    to_port     = 4789
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  tags {
    Name = "swarm-sg-manager"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "swarm_node" {
  name        = "sg_swarm_node"
  vpc_id      = "${aws_vpc.tf_vpc.id}"
  description = "Allows traffic from and to the EC2 instances of the sg-swarm-node Docker Swarm Nodes"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${aws_vpc.tf_vpc.cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 2374
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 2376
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "sg-swarm-node"
  }

  lifecycle {
    create_before_destroy = true
  }
}