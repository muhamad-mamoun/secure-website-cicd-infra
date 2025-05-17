terraform {
  backend "s3" {
    region       = "us-east-1"
    bucket       = "terraform-state-files-host"
    key          = "terraform.tfstate"
    use_lockfile = true
  }
}
