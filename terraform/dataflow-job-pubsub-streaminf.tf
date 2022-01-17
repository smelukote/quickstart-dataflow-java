resource "google_pubsub_topic" "example" {
  name = "example-topic"
  labels = {
    department = "engineering"
  }

  message_retention_duration = "86600s"
}

resource "google_storage_bucket" "smdata2020-dev-dfbucket1" {
  name          = "smdata2020-dev-dataflowpubsub-bucket1"
  location      = "US"
  force_destroy = true
}

resource "google_storage_bucket_object" "templates" {
  name    = "template_directory/"
  content = "Not really a directory, but it's empty."
  bucket  = google_storage_bucket.smdata2020-dev-dfbucket1.name
}

resource "google_storage_bucket_object" "temp" {
  name    = "temp_directory/"
  content = "Not really a directory, but it's empty."
  bucket  = google_storage_bucket.smdata2020-dev-dfbucket1.name
}

resource "google_storage_bucket_object" "samples" {
  name    = "samples_directory/"
  content = "Not really a directory, but it's empty."
  bucket  = google_storage_bucket.smdata2020-dev-dfbucket1.name
}

resource "google_dataflow_job" "pubsub_stream" {
  name                    = "tf-test-dataflow-job1"
  template_gcs_path       = "gs://smdata2020-dev-dataflowpubsub-bucket1/template_directory/Cloud_PubSub_to_GCS_Text"
  temp_gcs_location       = "gs://smdata2020-dev-dataflowpubsub-bucket1/temp_directory"
  enable_streaming_engine = true
  parameters = {
    outputDirectory = "gs://smdata2020-dev-dataflowpubsub-bucket1/samples_directory"
    inputTopic      = google_pubsub_topic.example.id
  }
  transform_name_mapping = {
    name = "test_job"
    env  = "dev"
  }
  on_delete = "cancel"
}