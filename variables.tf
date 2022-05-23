variable "name" {
  description = "The name of the amplify app"
  type        = string
}

variable "repository" {
  description = "The source repository link"
  type        = string
}

variable "access_token" {
  description = "Github access token to repository"
  type        = string
  sensitive   = true
}

variable "base_directory" {
  description = "Frontend artifacts baseDirectory"
  type        = string
  default     = "build"
}

variable "branches" {
  description = "Configuration block for branches' env vars and stage"
  type = list(object({
    branch_name           = string
    environment_variables = map(string)
    stage                 = string
  }))
  default = []
}

variable "domain_name" {
  description = "(Required) The domain name for the domain association."
  type        = string
  default     = ""
}

variable "wait_for_verification" {
  description = "If enabled, the resource will wait for the domain association status to change to PENDING_DEPLOYMENT or AVAILABLE."
  type        = bool
  default     = false
}

variable "subdomains" {
  description = "The branch name and prefix settings of the subdomain"
  type = list(object({
    branch_name = string
    prefix      = string
  }))
  default = []
}
