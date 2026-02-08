# CloudFlare Terraform Templates

This directory contains Terraform templates for deploying infrastructure to CloudFlare, including Workers, Pages, and DNS configurations.

## Prerequisites

1. **Terraform**: Install Terraform >= 1.0
   ```bash
   # Using nix (recommended)
   nix develop ../nix/terraform

   # Or download from https://www.terraform.io/downloads
   ```

2. **CloudFlare Account**: You need a CloudFlare account with:
   - An active zone (domain)
   - API token with appropriate permissions

3. **CloudFlare API Token**: Create an API token at:
   - https://dash.cloudflare.com/profile/api-tokens
   - Required permissions:
     - Account - Workers Scripts - Edit
     - Account - Workers KV Storage - Edit
     - Zone - DNS - Edit
     - Account - Cloudflare Pages - Edit

## Quick Start

### 1. Initialize Terraform

```bash
cd terraform
terraform init
```

### 2. Configure Variables

Copy the example variables file and customize it:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your CloudFlare settings:

```hcl
cloudflare_api_token    = "your-api-token"
cloudflare_account_name = "Your Account Name"
zone_name               = "yourdomain.com"

# Enable the services you want to deploy
deploy_workers = true
deploy_pages   = false
deploy_dns     = false
```

### 3. Plan and Apply

Review the changes Terraform will make:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

## Module Structure

```
terraform/
 main.tf                      # Main configuration
 variables.tf                 # Input variables
 outputs.tf                   # Output values
 versions.tf                  # Provider versions
 terraform.tfvars.example     # Example configuration
 .gitignore                   # Git ignore rules
 modules/
     workers/                 # CloudFlare Workers module
        main.tf
        variables.tf
        outputs.tf
     pages/                   # CloudFlare Pages module
        main.tf
        variables.tf
        outputs.tf
     dns/                     # CloudFlare DNS module
         main.tf
         variables.tf
         outputs.tf
```

## Modules

### Workers Module

Deploy CloudFlare Workers with KV namespaces, environment variables, and routes.

**Example configuration:**

```hcl
deploy_workers     = true
worker_name        = "my-api-worker"
worker_script_path = "./worker.js"

worker_routes = [
  {
    pattern = "api.example.com/*"
    zone_id = "your-zone-id"
  }
]

kv_namespaces = [
  { name = "MY_CACHE" },
  { name = "MY_DATA" }
]

worker_env_vars = {
  API_URL     = "https://backend.example.com"
  ENVIRONMENT = "production"
}

worker_secrets = {
  API_KEY     = "secret-key"
  DB_PASSWORD = "secret-password"
}
```

### Pages Module

Deploy CloudFlare Pages projects with build configuration.

**Example configuration:**

```hcl
deploy_pages            = true
pages_project_name      = "my-website"
pages_production_branch = "main"
pages_build_command     = "npm run build"
pages_destination_dir   = "dist"
pages_root_dir          = ""

pages_env_vars = {
  NODE_ENV    = "production"
  API_ENDPOINT = "https://api.example.com"
}
```

### DNS Module

Manage CloudFlare DNS records with proxying support.

**Example configuration:**

```hcl
deploy_dns = true

dns_records = [
  {
    name    = "www"
    type    = "CNAME"
    value   = "example.com"
    ttl     = 1
    proxied = true
  },
  {
    name    = "@"
    type    = "A"
    value   = "192.0.2.1"
    ttl     = 1
    proxied = true
  },
  {
    name    = "api"
    type    = "CNAME"
    value   = "example.com"
    ttl     = 1
    proxied = true
  }
]
```

## Common Commands

### Initialize
```bash
terraform init
```

### Format Code
```bash
terraform fmt -recursive
```

### Validate Configuration
```bash
terraform validate
```

### Plan Changes
```bash
terraform plan
```

### Apply Changes
```bash
terraform apply
```

### Destroy Infrastructure
```bash
terraform destroy
```

### Show Current State
```bash
terraform show
```

### List Resources
```bash
terraform state list
```

## Environment Variables

Instead of using `terraform.tfvars`, you can use environment variables:

```bash
export TF_VAR_cloudflare_api_token="your-token"
export TF_VAR_cloudflare_account_name="Your Account"
export TF_VAR_zone_name="example.com"
```

## Remote State (Optional)

For team collaboration, configure remote state storage. Uncomment the backend configuration in `main.tf`:

```hcl
backend "s3" {
  bucket = "your-terraform-state-bucket"
  key    = "cloudflare/terraform.tfstate"
  region = "us-east-1"
}
```

Or use Terraform Cloud:

```hcl
backend "remote" {
  organization = "your-org"
  
  workspaces {
    name = "cloudflare-infrastructure"
  }
}
```

## Security Best Practices

1. **Never commit `terraform.tfvars`** - It's in `.gitignore`
2. **Use environment variables** for sensitive data
3. **Enable remote state encryption**
4. **Use least-privilege API tokens**
5. **Store secrets in a secrets manager** (AWS Secrets Manager, HashiCorp Vault, etc.)
6. **Review plans carefully** before applying
7. **Use workspaces** for different environments (dev, staging, prod)

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Terraform

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.6.0
      
      - name: Terraform Init
        run: terraform init
        working-directory: ./terraform
        env:
          TF_VAR_cloudflare_api_token: ${{ secrets.CLOUDFLARE_API_TOKEN }}
      
      - name: Terraform Plan
        run: terraform plan
        working-directory: ./terraform
        env:
          TF_VAR_cloudflare_api_token: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          TF_VAR_cloudflare_account_name: ${{ secrets.CLOUDFLARE_ACCOUNT_NAME }}
      
      - name: Terraform Apply
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        run: terraform apply -auto-approve
        working-directory: ./terraform
        env:
          TF_VAR_cloudflare_api_token: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          TF_VAR_cloudflare_account_name: ${{ secrets.CLOUDFLARE_ACCOUNT_NAME }}
```

## Troubleshooting

### Authentication Issues
```bash
# Verify your API token
curl -X GET "https://api.cloudflare.com/client/v4/user/tokens/verify" \
  -H "Authorization: Bearer YOUR_API_TOKEN"
```

### State Lock Issues
```bash
# Force unlock (use with caution)
terraform force-unlock LOCK_ID
```

### Resource Import
```bash
# Import existing CloudFlare resources
terraform import cloudflare_worker_script.main account-id/script-name
```

## Additional Resources

- [CloudFlare Terraform Provider Documentation](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)
- [CloudFlare API Documentation](https://developers.cloudflare.com/api/)
- [Terraform Documentation](https://www.terraform.io/docs)
- [CloudFlare Workers Documentation](https://developers.cloudflare.com/workers/)
- [CloudFlare Pages Documentation](https://developers.cloudflare.com/pages/)

## Support

For issues or questions:
1. Check the [CloudFlare Community](https://community.cloudflare.com/)
2. Review [Terraform CloudFlare Provider Issues](https://github.com/cloudflare/terraform-provider-cloudflare/issues)
3. Consult [CloudFlare Documentation](https://developers.cloudflare.com/)

## License

See [LICENSE](../LICENSE) for details.
