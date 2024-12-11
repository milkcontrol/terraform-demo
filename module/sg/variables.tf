variable "production_name" {}
variable "enviroment" {}
variable "subnet_public_a_id" {}
variable "subnet_public_c_id" {}
variable "subnet_public_d_id" {}
variable "instance_type" { default = "t3.micro" }
variable "ami_id" { default = "ami-09a81b370b76de6a2" }
variable "vpc_id" {}
