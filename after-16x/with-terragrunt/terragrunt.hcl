terraform {
  source = "../../module"
}

terraform_version_constraint = "1.6.6"

remote_state {
  backend = "s3"
  config = {
    endpoints = {
      s3 = "http://127.0.0.1:9000"
    }

    profile = "local-minio"
    region  = "some_region"
    bucket  = "state"
    key     = "after-16x/with-terragrunt/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true

    skip_bucket_enforced_tls           = true
    skip_bucket_public_access_blocking = true
    skip_bucket_ssencryption           = true
    skip_bucket_root_access            = true
    skip_bucket_versioning             = true
    skip_requesting_account_id         = true
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}

inputs = {
  msg = "Hello from Terragrunt!"
}
