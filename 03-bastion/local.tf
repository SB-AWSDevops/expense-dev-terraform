locals {
  public_subnet_id_slice = slice(split(",", data.aws_ssm_parameter.public_subnet_ids.value), 0, 1)
  public_subnet_id       = join("", local.public_subnet_id_slice)
}
