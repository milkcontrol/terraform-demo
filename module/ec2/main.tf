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
  vpc_security_group_ids = [aws_security_group.demo_sg_a.id]  # Change from `security_groups` to `vpc_security_group_ids`
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
  vpc_security_group_ids = [aws_security_group.demo_sg_c.id]  # Change from `security_groups` to `vpc_security_group_ids`
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
  vpc_security_group_ids = [aws_security_group.demo_sg_d.id]  # Change from `security_groups` to `vpc_security_group_ids`
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


######SG#####
#####
####

# Security Group for instance A
resource "aws_security_group" "demo_sg_a" {
  name        = "${var.production_name}-sg-a"
  description = "Security group for EC2 instance in ap-northeast-1a"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Enviroment = var.enviroment
  }
}

# Security Group for instance C
resource "aws_security_group" "demo_sg_c" {
  name        = "${var.production_name}-sg-c"
  description = "Security group for EC2 instance in ap-northeast-1c"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Enviroment = var.enviroment
  }
}

# Security Group for instance D
resource "aws_security_group" "demo_sg_d" {
  name        = "${var.production_name}-sg-d"
  description = "Security group for EC2 instance in ap-northeast-1d"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Enviroment = var.enviroment
  }
}
