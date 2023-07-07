resource "aws_vpc" "ntier" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ntier"
  }

}

resource "aws_subnet" "a" {
  cidr_block        = var.application1-cidrs
  availability_zone = "${var.aws_region}a"
  vpc_id            = aws_vpc.ntier.id

  tags = {
    Name = "app1"
  }

  depends_on = [
    aws_vpc.ntier
  ]

}

resource "aws_subnet" "b" {
  cidr_block        = var.application2-cidrs
  availability_zone = "${var.aws_region}b"
  vpc_id            = aws_vpc.ntier.id

  tags = {
    Name = "app2"
  }

  depends_on = [
    aws_vpc.ntier
  ]

}

resource "aws_subnet" "c" {
  cidr_block        = var.db1-cidrs
  availability_zone = "${var.aws_region}a"
  vpc_id            = aws_vpc.ntier.id

  tags = {
    Name = "db1"
  }

  depends_on = [
    aws_vpc.ntier
  ]

}

resource "aws_subnet" "d" {
  cidr_block        = var.db2-cidrs
  availability_zone = "${var.aws_region}b"
  vpc_id            = aws_vpc.ntier.id

  tags = {
    Name = "db2"
  }

  depends_on = [
    aws_vpc.ntier
  ]

}