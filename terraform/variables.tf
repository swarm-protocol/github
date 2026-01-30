# CloudFlare API Configuration
variable "cloudflare_api_token" {
  description = "CloudFlare API token for authentication"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_name" {
  description = "CloudFlare account name"
  type        = string
}

variable "zone_name" {
  description = "CloudFlare zone (domain) name"
  type        = string
  default     = ""
}

# Workers Configuration
variable "deploy_workers" {
  description = "Whether to deploy CloudFlare Workers"
  type        = bool
  default     = false
}

variable "worker_name" {
  description = "Name of the CloudFlare Worker"
  type        = string
  default     = ""
}

variable "worker_script_path" {
  description = "Path to the worker script file"
  type        = string
  default     = ""
}

variable "worker_routes" {
  description = "Routes to attach to the worker"
  type = list(object({
    pattern = string
    zone_id = string
  }))
  default = []
}

variable "kv_namespaces" {
  description = "KV namespaces to create and bind to worker"
  type = list(object({
    name = string
  }))
  default = []
}

variable "worker_env_vars" {
  description = "Environment variables for the worker"
  type        = map(string)
  default     = {}
}

variable "worker_secrets" {
  description = "Secret environment variables for the worker"
  type        = map(string)
  sensitive   = true
  default     = {}
}

# Pages Configuration
variable "deploy_pages" {
  description = "Whether to deploy CloudFlare Pages"
  type        = bool
  default     = false
}

variable "pages_project_name" {
  description = "Name of the CloudFlare Pages project"
  type        = string
  default     = ""
}

variable "pages_production_branch" {
  description = "Production branch for CloudFlare Pages"
  type        = string
  default     = "main"
}

variable "pages_build_command" {
  description = "Build command for CloudFlare Pages"
  type        = string
  default     = "npm run build"
}

variable "pages_destination_dir" {
  description = "Output directory for CloudFlare Pages"
  type        = string
  default     = "dist"
}

variable "pages_root_dir" {
  description = "Root directory for CloudFlare Pages"
  type        = string
  default     = ""
}

variable "pages_env_vars" {
  description = "Environment variables for CloudFlare Pages"
  type        = map(string)
  default     = {}
}

# DNS Configuration
variable "deploy_dns" {
  description = "Whether to deploy CloudFlare DNS records"
  type        = bool
  default     = false
}

variable "dns_records" {
  description = "DNS records to create"
  type = list(object({
    name    = string
    type    = string
    value   = string
    ttl     = number
    proxied = bool
  }))
  default = []
}
