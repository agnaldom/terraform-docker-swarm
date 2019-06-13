variable "aws_region" {
  default = "us-west-2"
}

variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

# Variaveis do VPC
variable "vpc_cidr" {
  default = "10.123.0.0/16"
}

#Variaveis do Subnetes
variable "availability_zone" {
  default = "us-west-2a"
}

variable "cidr_block_public" {
  default = "10.123.1.0/24"
}

variable "cidr_block_private" {
  default = "10.123.2.0/24"
}

#Instance
variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-005bdb005fb00e791"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "./docker-swarm.pem"
}

variable "key_name" {
  description = "Desired name of Keypair..."
  default = "docker-swarm"
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default = "datauser.sh"
}