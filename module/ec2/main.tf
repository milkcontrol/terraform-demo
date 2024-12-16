# provider "aws" {
#   profile = "long"
#   region = "ap-northeast-1"
# }

######EC2#####
#####
####

# Create an EC2 instance in ap-northeast-1a
resource "aws_instance" "demo_instance_a" {
  ami           = var.ami_id # Specify the desired AMI
  instance_type = var.instance_type
  key_name      = var.key_name  # Use the key name from the aws_key_pair resource
  vpc_security_group_ids = [var.sg_id]  # Change from `security_groups` to `vpc_security_group_ids`
  subnet_id     = var.subnet_public.id

  tags = {
    Name = var.production_name
    Enviroment = var.enviroment
  }

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
}




