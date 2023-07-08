variable "aws_region" {
  type    = string
  default = "us-west-2"

}

variable "vpc_info" {
  type = object({
    vpc_cidr       = string
    subnet_azs     = list(string)
    subnet_names   = list(string)
    public_subnet  = list(string)
    private_subnet = list(string)
  })

  default = {
    subnet_azs     = ["a", "b", "a", "b", ]
    subnet_names   = ["app1", "app2", "db1", "db2", ]
    vpc_cidr       = "192.168.0.0/16"
    public_subnet  = []
    private_subnet = ["app1", "app2", "db1", "db2", ]
  }

}