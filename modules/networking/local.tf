locals {
  azs = data.aws_availability_zones.azs.names
  pub_sub_ids = aws_subnet.main[*].id
  private_sub_ids = aws_subnet.private[*].id
}