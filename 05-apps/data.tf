data "aws_ssm_parameter" "backend_sg_id" {
  name = "/${var.project_name}/${var.env}/backend_sg_id"
}

data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project_name}/${var.env}/frontend_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.env}/private_subnet_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.env}/public_subnet_id"
}

data "aws_ami" "ami_id"{

    most_recent = true
    owners = ["973714476881"]

    filter{

        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter{

        name = "root-device-type"
        values = ["ebs"]
    }

}
