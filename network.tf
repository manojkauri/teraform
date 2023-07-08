resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_info.vpc_cidr


  tags = {
    name = "ntier"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.vpc_info.subnet_names)
  cidr_block        = cidrsubnet(var.vpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.aws_region}${var.vpc_info.subnet_azs[count.index]}"
  vpc_id            = aws_vpc.ntier.id

  depends_on = [
    aws_vpc.ntier
  ]

  tags = {
    name = var.vpc_info.subnet_names[count.index]
  }
}

resource "aws_internet_gateway" "ntier-igw" {
  vpc_id = local.vpc_id

  tags = {
    name = "ntier-igw"
  }

  depends_on = [
    aws_vpc.ntier
  ]

}

resource "aws_route_table" "private" {
  vpc_id = local.vpc_id

  tags = {
    name = "private"
  }

}


resource "aws_route_table" "public" {
  vpc_id = local.vpc_id

  tags = {
    name = "public"
  }

  route = {
    cidr_block = local.anything
    gateway_id = aws_internet_gateway.ntier-igw.id
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:name"
    values = var.vpc_info.private_subnet
  }

  filter {
    name   = "vpc-id"
    values = local.vpc_id
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:name"
    values = var.vpc_info.public_subnet
  }

  filter {
    name   = "vpc-id"
    values = local.vpc_id
  }
}

resource "aws_route_table_association" "private_associatiom" {
  count          = length(data.aws_subnets.private.ids)
  subnet_id      = data.aws_subnets.private.id[count.index]
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "public_associatiom" {
  count          = length(data.aws_subnets.public.ids)
  subnet_id      = data.aws_subnets.public.id[count.index]
  route_table_id = aws_route_table.public.id

}


