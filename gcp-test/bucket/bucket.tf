resource "google_storage_bucket" "bucket" {
  name     = var.GCP_BUCKET_NAME
  location = var.GCP_REGION
}

# # Firestore Collection for State Locking
# resource "google_firestore_collection" "terraform_locks" {
#   # count = local.firestore_exists ? 0 : 1
#
#   project  = var.GCP_PROJECT_ID
#   name     = "terraform-lock-table"  # Firestore collection name
# }
#
# Firestore Document for LockID (representing the lock)
resource "google_firestore_document" "terraform_lock" {
  # count = local.firestore_exists ? 0 : 1

  project       = var.GCP_PROJECT_ID
  database      = "(default)"  # Default Firestore database
  collection    = "terraform-lock-table"
  document_id   = "LockID"  # The LockID used for state locking

  fields = {
    "LockID" = "terraform-lock"  # Document content to represent the lock
  }

  lifecycle {
    prevent_destroy = true
  }
}
#
# resource "google_datastore_entity" "terraform_lock" {
#   # count = local.datastore_exists ? 0 : 1
#
#   project     = var.GCP_PROJECT_ID
#   kind        = "TerraformLock"  # Entity kind for the lock
#   key {
#     name = "LockID"  # The unique identifier for the lock
#   }
#
#   properties = {
#     "LockID" = "terraform-lock"
#   }
#
#   lifecycle {
#     prevent_destroy = true  # Prevent accidental deletion of the lock entity
#   }
# }