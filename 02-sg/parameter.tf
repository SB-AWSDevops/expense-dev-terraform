resource "aws_ssm_parameter" "db_sg_id" {
  name  = "/${var.project_name}/${var.env}/db_sg_id"
  type  = "String"
  value = module.db.sg_id
  overwrite = true

}

resource "aws_ssm_parameter" "backend_sg_id" {
  name  = "/${var.project_name}/${var.env}/backend_sg_id"
  type  = "String"
  value = module.backend.sg_id
  overwrite = true

}

resource "aws_ssm_parameter" "frontend_sg_id" {
  name  = "/${var.project_name}/${var.env}/frontend_sg_id"
  type  = "String"
  value = module.frontend.sg_id
  overwrite = true

}
