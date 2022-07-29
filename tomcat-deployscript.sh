#!/bin/sh
#Note: This below shell script is for deploy job
#mvn package
#Maven should not install manual on any slave nodes.it installs by default through "Global tool configuratoin Maven Auot install Option"
#sudo yum install tomcat
#sudo service tomcat start
cd $workspace
#sudo /usr/local/tomcat/bin/shutdown.sh
sudo service tomcat stop
sudo rm -rf /usr/share/tomcat/webapps/gameoflife.war
sudo cp -r ${WORKSPACE}/gameoflife-web/target/*.war /usr/share/tomcat/webapps/
sudo chown -R tomcat:tomcat /usr/share/tomcat
sudo chmod -R 755 /usr/share/tomcat
sudo rm -rf /usr/share/tomcat/work/*
sudo rm -rf /usr/share/tomcat/temp/*
#sudo /usr/local/tomcat/bin/startup.sh
sudo service tomcat start
echo "####### Tomcat Status ############"
sudo ps -ef|grep tomcat
sudo echo "########## Tomcat WebApp directory listing of deployed app.war"
sudo ls -lrt /usr/share/tomcat/webapps/
sudo echo "######### Deployment completed #########"
