# provider "aws" {
#   profile = "long"
#   region = "ap-northeast-1"
# }

######EC2#####
#####
####

resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "demo_key_pair" {
  key_name   = "${var.production_name}-key"  # Specify a name for your key pair in AWS
  public_key = tls_private_key.demo_key.public_key_openssh
}


# Create an EC2 instance in ap-northeast-1a
resource "aws_instance" "demo_instance_a" {
  ami           = var.ami_id # Specify the desired AMI
  instance_type = var.instance_type
  key_name      = aws_key_pair.demo_key_pair.key_name  # Use the key name from the aws_key_pair resource
  vpc_security_group_ids = [var.sg_a_id]  # Change from `security_groups` to `vpc_security_group_ids`
  subnet_id     = var.subnet_public_a_id

  tags = {
    Name = var.production_name
    Enviroment = var.enviroment
  }

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
}

# Create an EC2 instance in ap-northeast-1c
resource "aws_instance" "demo_instance_c" {
  ami           = var.ami_id # Specify the desired AMI
  instance_type = var.instance_type
  key_name      = aws_key_pair.demo_key_pair.key_name
  vpc_security_group_ids = [var.sg_c_id]  # Change from `security_groups` to `vpc_security_group_ids`
  subnet_id     = var.subnet_public_c_id

  tags = {
    Name = var.production_name
    Enviroment = var.enviroment
  }

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
}

# Create an EC2 instance in ap-northeast-1d
resource "aws_instance" "demo_instance_d" {
  ami           = var.ami_id # Specify the desired AMI
  instance_type = var.instance_type
  key_name      = aws_key_pair.demo_key_pair.key_name
  vpc_security_group_ids = [var.sg_d_id]  # Change from `security_groups` to `vpc_security_group_ids`
  subnet_id     = var.subnet_public_d_id

  tags = {
    Name = var.production_name
    Enviroment = var.enviroment
  }

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
}



