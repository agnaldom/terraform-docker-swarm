/* resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id     = "${aws_ebs_volume.swarm.id}"
  instance_id    = "${aws_instance.master.id}"
}

resource "aws_ebs_volume" "swarm" {
  availability_zone = "${var.availability_zone}"
  size                      = 20
} */

resource "aws_instance" "master1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${var.bootstrap_path}")}"
  subnet_id = "${aws_subnet.subnet_public.id}"
  vpc_security_group_ids = [
    "${aws_security_group.elb_external.id}",
    "${aws_security_group.swarm_cluster.id}",
    "${aws_security_group.swarm_sg.id}"
  ]

tags = {
    Name  = "master1"
  }
} 

resource "aws_instance" "master2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${var.bootstrap_path}")}"
  subnet_id = "${aws_subnet.subnet_public.id}"
  vpc_security_group_ids = [
    "${aws_security_group.elb_external.id}",
    "${aws_security_group.swarm_cluster.id}",
    "${aws_security_group.swarm_sg.id}"
  ]

tags = {
    Name  = "master2"
  }
}

resource "aws_instance" "master3" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${var.bootstrap_path}")}"
  subnet_id = "${aws_subnet.subnet_public.id}"
  vpc_security_group_ids = [
    "${aws_security_group.elb_external.id}",
    "${aws_security_group.swarm_cluster.id}",
    "${aws_security_group.swarm_sg.id}"
  ]

tags = {
    Name  = "master3"
  }
} 