#Data source to pull most recent COS image URI
data "google_compute_image" "COS" {
  family  = "cos-stable"
  project = "gke-node-images"
}