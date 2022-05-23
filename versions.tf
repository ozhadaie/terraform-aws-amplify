terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.15.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.15.0"
    }
  }
}
