provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "practicaweb"
}

data "aws_vpc" "default" {
  default = true
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "2.7.0"

  name        = "websg"
  description = "Security group for a web server"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

resource "aws_instance" "web" {
  ami = "ami-035c67e6a9ef8f024"
  instance_type = "t2.micro"
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
  key_name = "practicaweb"
  tags {
    Name = "ciberweb"
  }
}

# Uncomment if domain registraion is made in route53
# resource "aws_route53_zone" "domain" {
#  name = "testing.com.es"
# }

resource "aws_route53_record" "www" {
  # zone_id = "${aws_route53_zone.domain.zone_id}"
  zone_id = "ZOEQZXS3IPJCT"
  name    = "www.testing.com.es"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]
}