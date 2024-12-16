variable "production_name" {}
variable "enviroment" {}
variable "sg_id" {}
variable "instance_type" { default = "t3.micro" }
variable "ami_id" { default = "ami-09a81b370b76de6a2" }
variable "subnet_public" { type = object({id: string}) }
variable "key_name" {}