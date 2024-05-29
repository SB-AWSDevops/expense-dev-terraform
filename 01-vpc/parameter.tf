resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.env}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
  //overwrite = true
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.env}/public_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.public_subnet_ids)
  //overwrite = true
}

resource "aws_ssm_parameter" "db_subnet_group_name" {
  name  = "/${var.project_name}/${var.env}/db_subnet_group_name"
  type  = "String"
  value = module.vpc.database_subnet_group_name
  //overwrite = true
}