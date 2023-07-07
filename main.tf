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