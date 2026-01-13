resource "aws_vpc" "eks-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "eks-vpc"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = local.subnet1_cidr
  availability_zone = local.subnet1_zone
  map_public_ip_on_launch = true

  tags = {
    Name = local.subnet1_tag
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = local.subnet2_cidr
  availability_zone = local.subnet2_zone
  map_public_ip_on_launch = true

  tags = {
    Name = local.subnet2_tag
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = local.subnet3_cidr
  availability_zone = local.subnet3_zone
  map_public_ip_on_launch = true

  tags = {
    Name = local.subnet3_tag
  }
}

resource "aws_internet_gateway" "eks-gw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name = local.igw_tag
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-gw.id
  }

  tags = {
    Name = local.rt_tag
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.public-route-table.id
}

output "subnet_ids" {
    value = [
        aws_subnet.public-subnet-1.id,
        aws_subnet.public-subnet-2.id,
        aws_subnet.public-subnet-3.id
    ]
}