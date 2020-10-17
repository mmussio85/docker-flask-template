resource "google_compute_firewall" "default" {
	  name    = "docker-firewall"
	  network = "default"

	  allow {
	    protocol = "tcp"
	    ports    = ["5000", "5432"]
	  }

	  source_tags = ["docker-web"]
	  source_ranges = ["0.0.0.0/0"]
	  
}		  

