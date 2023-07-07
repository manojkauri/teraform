variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "enter region to create resources"
}

variable "ntier-vpc-range" {
  type        = string
  default     = "192.168.0.0/16"
  description = "vpc cidr range"
}

variable "application1-cidrs" {
  type    = string
  default = "192.168.1.0/24"

}

variable "application2-cidrs" {
  type    = string
  default = "192.168.2.0/24"

}

variable "db1-cidrs" {
  type    = string
  default = "192.168.3.0/24"

}

variable "db2-cidrs" {
  type    = string
  default = "192.168.4.0/24"

}