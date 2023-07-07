resource "aws_vpc" "ntier" {
  cidr_block = var.vpc-range


  tags = {
    name = "ntier"
  }
}

resource "aws_subnet" "subnets" {
  count             = 4
  cidr_block        = var.subnets[count.index]
  availability_zone = "${var.aws_region}${var.subnet-azs[count.index]}"
  vpc_id            = aws_vpc.ntier.id

  depends_on = [
    aws_vpc.ntier
  ]

  tags = {
    name = var.tags-subnet[count.index]
  }
}