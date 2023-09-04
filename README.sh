# Docker1) Install Docker on your VM with the help of the following commands (only for Ubuntu and Debian Operating Systems)

  install packages:

    sudo apt update
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        jq
        
  Add Docker’s official GPG key:
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
setup repository:

    echo \
      "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      
Install Docker Engine:

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    Add your user to the docker group:

    sudo usermod -aG docker $USER
    
Docker Compose
download the current stable release of Docker Compose:

    COMPOSE_VERSION=$(curl -s "https://api.github.com/repos/docker/compose/tags" | jq -r '.[0].name')
    sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
      -o /usr/local/bin/docker-compose
Apply executable permissions to the binary:

    sudo chmod +x /usr/local/bin/docker-compose

2)Pull nginx & hello-world:  
  
        docker pull hello-world
        docker pull nginx

3)Port forward nginx to port 80: <br>
    `docker run --name mynginxl -p 80:80 -d nginx`

Open your public ip after successfully executing this command.

4)View images: <br>

  `docker images`

5)Pull apache2: <br>

   `docker pull ubuntu/apache2`

6) Kill nginx to allocate port 80 to apache2: <br>
   `docker kill <container_id_nginx>`

  To grab the container id of nginx, run `docker ps`

7) Finally, port apache2 to port 80: <br>
   `docker run --name apache -p 80:80 -d ubuntu/apache2`
 
   and reopen your public ip.(see your public ip change)
