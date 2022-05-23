output "cv_dns_record" {
  value = length(aws_amplify_domain_association.this) == 0 ? "" : aws_amplify_domain_association.this[0].certificate_verification_dns_record
}

output "sd_dns_record" {
  value = length(aws_amplify_domain_association.this) == 0 ? [] : aws_amplify_domain_association.this[0].sub_domain[*].dns_record
}
