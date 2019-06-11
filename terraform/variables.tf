variable "aws_region" {
    default = "eu-west-3"
}
variable "aws_access_key_id"{}
variable "aws_secret_access_key"{}
# Variaveis do VPC
variable "vpc_cidr" {
    default="172.30.0.0/16"
}
#Variaveis do Subnetes
variable "availability_zone" {
    default = "eu-west-3a"
}
variable "cidr_block_public" {
    default="172.30.0.0/20"
}
variable "cidr_block_private" {
    default="172.30.16.0/20"
}