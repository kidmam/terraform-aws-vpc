# bastion

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "vpc.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "../../modules/vpc"

  region = "ap-northeast-2"
  city   = "SEOUL"
  stage  = "DEV"
  name   = "DEMO"

  cidr_block = "10.10.0.0/16"
  topology   = "private"
  newbits    = "3"

  instance_type = "t2.nano"

  key_name    = "nalbam-seoul"
  base_domain = "nalbam.com"

  allow_ip_address = [
    "58.151.93.9/32", # 강남 echo "$(curl -sL icanhazip.com)/32"
  ]
}

output "name" {
  value = "${module.vpc.name}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "subnet_public_ids" {
  value = "${module.vpc.subnet_public_ids}"
}

output "subnet_private_ids" {
  value = "${module.vpc.subnet_private_ids}"
}

output "bastion_doamin" {
  value = "${module.vpc.bastion_doamin}"
}

output "bastion_ip" {
  value = "${module.vpc.bastion_ip}"
}
