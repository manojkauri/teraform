variable "aws_region" {
  type    = string
  default = "us-west-2"

}

variable "vpc-range" {
  type    = string
  default = "192.168.0.0/16"

}

variable "subnets" {
  type    = list(string)
  default = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", ]
}

variable "subnet-azs" {
  type    = list(string)
  default = ["a", "b", "a", "b", ]

}

variable "tags-subnet" {
  type    = list(string)
  default = ["app1", "app12", "db1", "db2", ]

}