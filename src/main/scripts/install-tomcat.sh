sudo yum update
#create tomcat user
sudo groupadd tomcat

#download tomcat
 sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz

#extract
sudo tar -xvf apache-tomcat-9.0.75.tar.gz

#start up tomcat
cd /apache-tomcat-9.0.75/bin/
sudo ./startup.sh



