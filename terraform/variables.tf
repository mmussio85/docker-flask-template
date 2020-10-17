variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "project_name" {
  default = "fleet-range-260403"
}

variable "instance_name" {
  default = "terraform-instance"
}

variable "vm_type" {
  default = "f1-micro"
  
}

variable "os" {
  default = "debian-cloud/debian-9"
}