provider "null" {
  #version = "2.1.0"
}

resource "null_resource" "example" {

  triggers = {
    key = uuid()
  }

  connection {
    type     = "ssh"
    host     = var.host
    user     = var.username
    password = var.password
  }

  #provisioner "remote-exec" {
  #  inline = [
  #    "cd ~/Docker",
  #    "rm -rf Nginx",
  #  ]
  #}

  #provisioner "remote-exec" {
  #  inline = [
  #    "cd /home/ajeya/Docker",
  #    "mkdir -p Nginx"
  #  ]
  #}

  provisioner "file" {
    source      = "Nginx"
    destination = "/home/ajeya/Docker"
  }

  #provisioner "remote-exec" {
  #  inline = [
  #    "cd /home/ajeya/Docker/Nginx",
  #    #"docker compose up -d --force-recreate"
  #    "docker compose down"
  #  ]
  #}
}


#terraform init
#terraform apply --auto-approve
