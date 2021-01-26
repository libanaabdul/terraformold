provider "aws" {
  region     = var.region
  access_key = var.accesskey
  secret_key = var.secretkey
}

provider "aws" {
  alias = "acm_account"
  region = "us-east-1"
}

provider "aws" {
  alias = "route53_account"
  region = "us-east-1"
}

provider "aws" {
  alias = "dns_zones"
  region = "us-east-1"
}

module "qa-ec2" {
    source = "../modules/ec2"
    vpclib = module.qa-vpc.vpclib
    subnet1 = module.qa-subnets.subnet1
    sgmonitor = module.qa-sg.sgmonitor
} 

module "qa-sg" {
    source = "../modules/securitygroups"
    vpclib = module.qa-vpc.vpclib
}

module "qa-vpc" {
    source = "../modules/vpc"
}

module "qa-subnets" {
    source = "../modules/subnets"
    vpclib = module.qa-vpc.vpclib
}

module "qa-rds" {
    source = "../modules/rds"
    vpclib = module.qa-vpc.vpclib
    rds1 = module.qa-sg.rds1
    dbsubnet = module.qa-subnets.dbsubnet
}

module "qa-alb" {
    source = "../modules/alb"
    sgmonitor = module.qa-sg.sgmonitor
    subnet1 = module.qa-subnets.subnet1
    subnet2 = module.qa-subnets.subnet2
    vpclib = module.qa-vpc.vpclib
    certificate_arn = module.qa-acm.certificate_arn  

}

module "qa-services-ecs" {
  source = "../modules/service_ecs"
  subnet1 = module.qa-subnets.subnet1
  subnet2 = module.qa-subnets.subnet2
}

module "qa-acm" {
    source = "../modules/acm"
    depends_on = [module.qa-ec2, module.qa-sg, module.qa-vpc, module.qa-subnets, module.qa-rds]
}