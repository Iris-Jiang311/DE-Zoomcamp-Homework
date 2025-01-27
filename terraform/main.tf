terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.17.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}


resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_cname
  location      = var.location
  force_destroy = true

}

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}