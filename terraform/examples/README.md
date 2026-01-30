# CloudFlare Terraform Examples

This directory contains example configurations and scripts for CloudFlare deployments.

## Files

- `worker.js` - Example CloudFlare Worker script with routing and KV usage

## Using the Examples

### Worker Example

1. Copy the worker script to your project:
   ```bash
   cp examples/worker.js ./my-worker.js
   ```

2. Customize the worker script for your needs

3. Reference it in your `terraform.tfvars`:
   ```hcl
   worker_script_path = "./my-worker.js"
   ```
