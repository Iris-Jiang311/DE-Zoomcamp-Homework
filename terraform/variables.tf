variable "credentials" {
  description = "My Credentials"
  default     = "/Users/jiangyonglin/Desktop/Machine Learning/DE Zoomcamp/Docker-sql/terrademo/keys/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "469800157455"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}
variable "gcs_bucket_cname" {
  description = "My Storage Bucket Name"
  default     = "my-project-id-terra-bucket-iris"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}