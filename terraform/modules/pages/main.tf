# CloudFlare Pages Project
resource "cloudflare_pages_project" "main" {
  account_id        = var.account_id
  name              = var.project_name
  production_branch = var.production_branch

  build_config {
    build_command   = var.build_command
    destination_dir = var.destination_dir
    root_dir        = var.root_dir
  }

  # Deployment configuration
  deployment_configs {
    preview {
      environment_variables = var.environment_variables
      
      compatibility_date  = "2023-01-01"
      compatibility_flags = []
    }
    
    production {
      environment_variables = var.environment_variables
      
      compatibility_date  = "2023-01-01"
      compatibility_flags = []
    }
  }
}
