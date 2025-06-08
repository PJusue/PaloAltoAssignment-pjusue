module "route_53_hostzone" {
  source      = "../../modules/route53"
  domain_name = "poc.example-paloalto.com"
  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
    Terraform   = "true"
  }
}
module "acm_palo_alto" {
  source = "../../modules/acm"
  domain_name = "poc.example-paloalto.com"
  subject_alternative_names = [
    "*.poc.example-paloalto.com"
  ]
  zone_id = module.route_53_hostzone.zone_id
  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
    Terraform   = "true"
  }
}