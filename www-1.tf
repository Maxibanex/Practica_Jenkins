resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-23-10-x64"
  name = "www-1"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",

      # Instalar Docker
      apt-get update,
      apt-get -y install docker.io,

      # Instalar Docker Compose
      curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      chmod +x /usr/local/bin/docker-compose,  

      # Install Docker
      #"sudo apt-get update",
      #"sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common",
      #"curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
      #"echo 'deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable' | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      #"sudo apt-get update",
      #"sudo apt-get -y install docker-ce docker-ce-cli containerd.io",

      # Install Docker Compose
      #"sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      #"sudo chmod +x /usr/local/bin/docker-compose",

      # Install Git
      "sudo apt-get -y install git"

    ]
  }
}