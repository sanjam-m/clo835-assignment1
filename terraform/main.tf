provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
}

module "global_vars" {
  source = "../../global_vars"
}

locals {
  default_tags = merge(module.global_vars.default_tags, { "env" = var.env })
  prefix       = module.global_vars.prefix
  name_prefix  = "${local.prefix}-${var.env}"
}

resource "aws_instance" "host_machine" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.host_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = data.aws_iam_instance_profile.lab_profile.name

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-Amazon-Linux-Host"
    }
  )
}

resource "aws_key_pair" "key_pair" {
  key_name   = local.name_prefix
  public_key = file("${local.name_prefix}.pub")
}

resource "aws_security_group" "host_sg" {
  name        = "host_sg"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "tcp"
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-sg"
    }
  )
}

resource "aws_eip" "static_eip" {
  instance = aws_instance.host_machine.id
  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-eip"
    }
  )
}

resource "aws_ecr_repository" "ecr_repository" {
  for_each             = var.ecr_repos
  name                 = "${local.name_prefix}-${each.value}"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

data "aws_iam_instance_profile" "lab_profile" {
  name = "LabInstanceProfile"
}