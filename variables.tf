variable region {
  default = "ap-northeast-2"
}

variable "name" {
  default = "demo"
}

variable "vpc_id" {
  default = ""
}

variable "vpc_cidr" {
  default = "10.99.0.0/16"
}

variable "key_name" {
  default = "nalbam-seoul"
}

variable "enable_eip" {
  default = true
}

variable "base_domain" {
  default = "nalbam.com"
}