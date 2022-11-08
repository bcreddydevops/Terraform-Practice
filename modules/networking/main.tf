resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = var.tags
}

# create public subnet
resource "aws_subnet" "main" {
    count = length(var.pub_cidrs)
    vpc_id = aws_vpc.main.id
    availability_zone = local.azs[count.index]
    cidr_block = var.pub_cidrs[count.index]

    tags = {
        Name = "Public-${count.index +1}"
    }
  }

  #create Internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "Public-IGWDemo"
  }

}

# Create route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Public-RT"
  }
}

# Attach public subnet to public route table
resource "aws_route_table_association" "public" {
  count = length(local.pub_sub_ids)
  subnet_id = local.pub_sub_ids[count.index]
  route_table_id = aws_route_table.public.id
} 

# Create Private subnets
resource "aws_subnet" "private" {
    count = length(var.private_cidrs)
    vpc_id = aws_vpc.main.id
    availability_zone = local.azs[count.index]
    cidr_block = var.private_cidrs[count.index]

    tags = {
        Name = "Private-${count.index +1}"
    }
  }

  # Create route table for private subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "Private-RT"
  }
}

# Attach private subnets to private route table
resource "aws_route_table_association" "private" {
  count = length(local.private_sub_ids)
  subnet_id = local.private_sub_ids[count.index]
  route_table_id = aws_route_table.private.id
} 