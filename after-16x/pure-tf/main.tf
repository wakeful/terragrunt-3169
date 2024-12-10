terraform {
  required_version = "1.6.6"

  backend "s3" {
    profile = "local-minio"
    endpoints = {
      s3 = "http://127.0.0.1:9000"
    }
    region = "some_region"
    bucket = "state"
    key    = "after-16x/pure-tf/terraform.tfstate"

    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    use_path_style              = true
  }
}

module "enriched" {
  source = "../../module"
  msg    = "here is my message"
}

output "msg" {
  value = module.enriched.msg
}
