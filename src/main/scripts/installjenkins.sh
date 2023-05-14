sudo -i

sudo yum update -y

#Install Jenkins :

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins

#Install epel Package:
amazon-linux-extras install epel
#Install Java:
amazon-linux-extras install java-openjdk11

#Start Jenkins:

# Start jenkins service
service jenkins start

# Setup Jenkins to start at boot,
chkconfig jenkins on

to get the admin password
cat /var/lib/jenkins/secrets/initialAdminPassword


