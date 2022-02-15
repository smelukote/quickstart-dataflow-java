terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.6.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "smdata2022"
  region  = "us-central1"
}