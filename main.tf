provider "google" {

  credentials = var.sa_key
  #project = var.project_id
}
 
variable "sa_key" {
  default =  ""
}
resource "google_sql_database_instance" "main" {
  name             = "psc-enabled-main-instance"
  database_version = "MYSQL_8_0"
  settings {
    tier    = "db-f1-micro"
    
    backup_configuration {
      enabled = true
      binary_log_enabled = true
    }
    availability_type = "REGIONAL"
  }
}
