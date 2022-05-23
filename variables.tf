variable "name" {
  description = "(Required) The name of the Amplify app"
  type        = string
}

variable "repository" {
  description = "(Optional) The repository for an Amplify app"
  type        = string
  default     = ""
}

variable "access_token" {
  description = "(Optional) The personal access token for a third-party source control system for an Amplify app. The personal access token is used to create a webhook and a read-only deploy key. The token is not stored."
  type        = string
  sensitive   = true
  default     = ""
}

variable "base_directory" {
  description = "Frontend artifacts base directory"
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
