# terraform-aws-icon-ingress-dns

A terraform module to create CNAME records in AWS Route 53 to for the ELB automatically created by the NGINX ingress controller in the k8s cluster.
This module receives the hostname of the ELB and creates records for:

`prometheus.<region>.<root-domain>`

`grafana.<region>.<root-domain>`

`alertman.<region>.<root-domain>`

## Inputs

- zone_id: The Route 53 hosted zone ID for record insertion
- root_domain_name: The root domain of your Route 53 hosted zone
- region: The region where the instances are hosted
- elb_host_name: The hostname for the ELB created by the k8s cluster

## Outputs

None, aside from the records being added to your zone.
