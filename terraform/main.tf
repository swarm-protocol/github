# CloudFlare Infrastructure Configuration
# This file defines the main infrastructure resources for CloudFlare deployment

# Version constraints are defined in versions.tf

terraform {
  # Uncomment and configure backend for remote state management
  # backend "s3" {
  #   bucket = "your-terraform-state-bucket"
  #   key    = "cloudflare/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

# Configure the CloudFlare Provider
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# Get account information
data "cloudflare_accounts" "main" {
  name = var.cloudflare_account_name
}

# Get zone information if using DNS
data "cloudflare_zone" "main" {
  count = var.zone_name != "" ? 1 : 0
  name  = var.zone_name
}

# Example: CloudFlare Workers deployment
module "workers" {
  source = "./modules/workers"
  
  count = var.deploy_workers ? 1 : 0

  account_id    = data.cloudflare_accounts.main.accounts[0].id
  worker_name   = var.worker_name
  worker_script = var.worker_script_path
  worker_routes = var.worker_routes
  
  # KV Namespaces
  kv_namespaces = var.kv_namespaces
  
  # Environment variables
  environment_variables = var.worker_env_vars
  secrets              = var.worker_secrets
}

# Example: CloudFlare Pages deployment
module "pages" {
  source = "./modules/pages"
  
  count = var.deploy_pages ? 1 : 0

  account_id        = data.cloudflare_accounts.main.accounts[0].id
  project_name      = var.pages_project_name
  production_branch = var.pages_production_branch
  
  # Build configuration
  build_command       = var.pages_build_command
  destination_dir     = var.pages_destination_dir
  root_dir           = var.pages_root_dir
  
  # Environment variables
  environment_variables = var.pages_env_vars
}

# Example: CloudFlare DNS records
module "dns" {
  source = "./modules/dns"
  
  count = var.deploy_dns && var.zone_name != "" ? 1 : 0

  zone_id     = data.cloudflare_zone.main[0].id
  dns_records = var.dns_records
}
