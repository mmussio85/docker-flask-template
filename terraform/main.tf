terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"

  credentials = file("/Users/marcosmussio/.config/gcloud/application_default_credentials.json")

  project = "${var.project_name}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  machine_type = "${var.vm_type}"

  metadata = {
    ssh-keys = "marcos:${file("~/Desktop/key.pub")}"
  }

  boot_disk {
    initialize_params {
    	image = "${var.os}"
    }
  }
  tags = [
    "docker-web",
  ]

  provisioner "remote-exec" {
    inline = [
      	"sudo apt install git -y",
      	"git clone https://github.com/mmussio85/docker-flask-template",
		"sudo apt-get update",
		"sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y",
		"curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - ",
		"sudo add-apt-repository    \"deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable\" ",
		"sudo apt-get update",
		"sudo apt-get install docker-ce docker-ce-cli containerd.io -y",
		"sudo curl -L \"https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
		"sudo chmod +x /usr/local/bin/docker-compose",
		"cd docker-flask-template/",
		"sudo docker-compose up",
      	"touch mussio.txt",
    ]
    connection {
            host= "${self.network_interface.0.access_config.0.nat_ip}"
            type="ssh"
            user="marcos"
            private_key="${file("~/Desktop/key")}"
            

        }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

