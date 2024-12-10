terraform {
  source = "../../module"
}

terraform_version_constraint = "1.5.7"

remote_state {
  backend = "s3"
  config = {
    profile  = "local-minio"
    endpoint = "http://127.0.0.1:9000"
    region   = "some_region"
    bucket   = "state"
    key      = "before-16x/with-terragrunt/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true

    skip_bucket_enforced_tls           = true
    skip_bucket_public_access_blocking = true
    skip_bucket_ssencryption           = true
    skip_bucket_root_access            = true
    skip_bucket_versioning             = true
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}

inputs = {
  msg = "Hello from Terragrunt!"
}
