output "vpc_id" {
  value = "${aws_vpc.tf_vpc.id}"
}

output "subnet_public" {
  value = "${aws_subnet.subnet_public.id}"
}

output "sg_elb_external" {
  value = "${aws_security_group.elb_external.id}"
}

output "sg_swarm_cluster" {
  value = "${aws_security_group.swarm_cluster.id}"
}

output "sg_swarm" {
  value = "${aws_security_group.swarm_sg.id}"
}

output "sg_swarm_node" {
  value = "${aws_security_group.swarm_node.id}"
}

output "master1_public_ip" {
    value = ["${aws_instance.master1.public_ip}"]
}
 
output "master2_public_ip" {
    value = ["${aws_instance.master2.public_ip}"]
}

output "master3_public_ip" {
    value = ["${aws_instance.master3.public_ip}"]
} 

output "node1_public_ip" {
    value = ["${aws_instance.node1.public_ip}"]
}
 
output "node2_public_ip" {
    value = ["${aws_instance.node2.public_ip}"]
}

output "node3_public_ip" {
    value = ["${aws_instance.node3.public_ip}"]
} 