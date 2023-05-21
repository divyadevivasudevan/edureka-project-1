#Installing Ansible in ubuntu OS:
sudo apt-add-repository ppa:ansible/ansible
sudo apt install python3
sudo apt update
sudo apt install ansible

#Check the Ansible version:
ansible --version


 sudo su -
$ useradd ansadmin
$ passwd ansadmin
Changing password for user ansadmin
New password:
Retype new password:
passwd: all authentication tokens updated successfully.

Deploy on Docker using Ansible & Jenkins
Posted on September 20, 2020 by Jay Jo
Prerequisites
Install Ansible
Add Ansible Server user
Sudo Access to ansible user
Install Docker in ansible server
Add a new user in Docker Group
Setting up Password Authentication
Create SSH Keygen
Add ansible user at the target server
Copy Key for Target System
Test Connectivity by PING TEST
Integrate Ansible with Jenkins
Basic Jenkins Job for Ansible
After adding Docker file and yml file, run ansible-playbook in Ansible server
Run ansible-playbook in Jenkins
Poll SCM for automation for GitHub
DockerHub integration with Ansible
Using Ansible, push Docker image to Docker Hub.
Using Jenkins Job, Docker Deploy using Docker Hub
Manual
Automation with Jenkins
Prerequisites
EC2 Instance
With Internet Access
Security Group with Port 8080 open for internet

2. Jenkins Server & Target Server.

Install Ansible
$ sudo su -
$ yum install python
$ yum install python-pip
$ pip install ansible
$ ansible --version
You need python to install Ansible.
Directory is needed for recent version of ansible.

$ mkdir /etc/ansible
Add Ansible Server user
$ sudo su -
$ useradd ansadmin
$ passwd ansadmin
Changing password for user ansadmin
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
Remember the password
Grant sudo Access to ansible user

$ visudo

## Read drop-in files from /etc/sudoers.d (the # here does not mean a comment)
#includedir /etc/sudoers.d
ansadmin ALL=(ALL) NOPASSWD: ALL

Install Docker in ansible server
$ yum install docker
$ service docker status
$ service docker start
Install and Execute Docker
Add a new user in Docker Group
$ usermod -aG docker ansadmin
$ sudo service docker restart

Setting up Password Authentication
EC2(Amazon Linux Server), default password authentication setting is no

$ vi /etc/ssh/sshd_config
# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication yes
#PermitEmptyPasswords no
#PasswordAuthentication no
PasswordAuthentication yes

Service reload

$ service sshd reload