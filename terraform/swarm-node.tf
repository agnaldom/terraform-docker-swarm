/* resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id     = "${aws_ebs_volume.swarm.id}"
  instance_id    = "${aws_instance.master.id}"
}

resource "aws_ebs_volume" "swarm" {
  availability_zone = "${var.availability_zone}"
  size                      = 20
} */

resource "aws_instance" "node1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${var.bootstrap_path}")}"
  subnet_id = "${aws_subnet.subnet_private.id}"
  vpc_security_group_ids = [
    "${aws_security_group.swarm_node.id}"
  ]

tags = {
    Name  = "node1"
  }
} 

resource "aws_instance" "node2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${var.bootstrap_path}")}"
   subnet_id = "${aws_subnet.subnet_private.id}"
  vpc_security_group_ids = [
    "${aws_security_group.swarm_node.id}"
  ]

tags = {
    Name  = "node2"
  }
}

resource "aws_instance" "node3" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${var.bootstrap_path}")}"
   subnet_id = "${aws_subnet.subnet_private.id}"
  vpc_security_group_ids = [
    "${aws_security_group.swarm_node.id}"
  ]

tags = {
    Name  = "node3"
  }
} 