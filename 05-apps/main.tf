module "backend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.env}-backend"

  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_sg_id.value]
  subnet_id              = local.private_subnet_id
  ami                    = data.aws_ami.ami_id.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.env}-backend"
    }
  )
}

module "frontend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.env}-frontend"

  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.frontend_sg_id.value]
  subnet_id              = local.public_subnet_id
  ami                    = data.aws_ami.ami_id.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.env}-frontend"
    }
  )
}

module "ansible" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.env}-ansible"

  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.ansible_sg_id.value]
  subnet_id              = local.public_subnet_id
  ami                    = data.aws_ami.ami_id.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.env}-ansible"
    }
  )
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name
  records = [
    {
      name    = "backend"
      type    = "A"
      ttl     = 1
      records = [
        module.backend.private_ip
      ]
    },
    {
      name    = "backend"
      type    = "A"
      ttl     = 1
      records = [
        module.frontend.private_ip
      ]
    },
    {
      name    = ""
      type    = "A"
      ttl     = 1
      records = [
        module.frontend.public_ip
      ]
    },
  ]
}

