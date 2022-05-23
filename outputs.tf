output "certificate_verification_dns_record" {
  value       = var.subdomains ? aws_amplify_domain_association.this[0].certificate_verification_dns_record : null
  description = "The DNS record for certificate verification."
}

output "sub_domain_dns_record" {
  value       = var.subdomains ? aws_amplify_domain_association.this[0].sub_domain[*].dns_record : null
  description = "The DNS record for the subdomain."
}
