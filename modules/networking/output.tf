output "pub_sub_ids" {
  value = aws_subnet.main[*].id

} 

output "private_sub_ids" {
  value = aws_subnet.private[*].id

} 

output "vpc_id" {
  value = aws_vpc.main.id

} 