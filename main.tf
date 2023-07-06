resource "aws_vpc" "ntier" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ntier"
  }

}

resource "aws_subnet" "ntier" {
  cidr_block        = var.application1-cidrs
  availability_zone = "${var.aws_region}a"
  vpc_id            = aws_vpc.ntier.id

  depends_on = [
    aws_vpc.ntier
  ]

}