sudo su -
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/9/x86_64/stable/repodata/repomd.xml
sudo yum install docker
sudo systemctl start docker
sudo systemctl enable docker

## Test the installation by running a simple container:
	docker run hello-world

sudo systemctl start docker.service #<-- start the service
sudo systemctl stop docker.service #<-- stop the service
sudo systemctl restart docker.service #<-- restart the service
sudo systemctl status docker.service #<-- get the service status

sudo docker images