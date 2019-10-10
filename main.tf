data "aws_caller_identity" "this" {}
data "aws_region" "current" {}

terraform {
  required_version = ">= 0.12"
}

resource "aws_route53_record" "prom-record" {
  allow_overwrite = true
  name            = join(".", ["prometheus", var.region, var.root_domain_name])
  ttl             = 30
  type            = "CNAME"
  zone_id         = var.zone_id

  records = var.elb_host_name
}

resource "aws_route53_record" "graf-record" {
  allow_overwrite = true
  name            = join(".", ["grafana", var.region, var.root_domain_name])
  ttl             = 30
  type            = "CNAME"
  zone_id         = var.zone_id

  records = var.elb_host_name
}

resource "aws_route53_record" "alertman-record" {
  allow_overwrite = true
  name            = join(".", ["alertman", var.region, var.root_domain_name])
  ttl             = 30
  type            = "CNAME"
  zone_id         = var.zone_id

  records = var.elb_host_name
}