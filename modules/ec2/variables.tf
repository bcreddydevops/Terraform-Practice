variable "instance_type" {
  description = "Instance type to create ec2 instance"
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI id for creating ec2 instance"
}

variable "subnet_id" {
  description = "subnet id for creating ec2 instance"
}

variable "vpc_id" {
  description = "VPC id for creating sg "
}

variable "ec2_count" {
  description = "Number of ec2 instance to create"
  default     = 1
}

variable "sg_ingress" {
  type = list(any)
  default = [

  ]
}

variable "key_name" {
  default = ""

}