terraform {
  required_version = "1.5.7"

  backend "s3" {
    profile  = "local-minio"
    endpoint = "http://127.0.0.1:9000"
    region   = "some_region"
    bucket   = "state"
    key      = "before-16x/pure-tf/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

module "enriched" {
  source = "../../module"
  msg    = "here is my message"
}

output "msg" {
  value = module.enriched.msg
}
