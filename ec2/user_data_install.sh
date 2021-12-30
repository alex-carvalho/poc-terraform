#!/bin/bash
sudo yum update -y

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo curl https://pkg.jenkins.io/redhat-stable/jenkins.repo --output /etc/yum.repos.d/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo amazon-linux-extras install epel -y 

sudo yum install -y yum-utils terraform java-1.8.0-openjdk jenkins

sudo systemctl start jenkins