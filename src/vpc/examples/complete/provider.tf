provider "aws" {
  region                   = "eu-west-1"
  shared_credentials_files = [pathexpand("~/.aws/credentials")]
  profile                  = "TF_TEST_PROFILE"
}
