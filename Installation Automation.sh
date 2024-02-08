#!/bin/bash

# Install Python
echo "==========================="
echo "1. Install Python"
echo "==========================="
yum install python -y
sleep 10
echo "==== Python Installed ======="
echo "Python Version:"
python --version
echo "=============================="

echo
echo
echo

# Install AWS CLI
echo "=============================="
echo "2. Install AWS CLI"
echo "=============================="
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sleep 10
yum install unzip -y
sleep 10
unzip awscliv2.zip
sleep 10
./aws/install
echo "====== AWS CLI Installed ==========="
echo "AWS Version: "
aws --version
echo "===================================="

echo
echo
echo

# Install GIT
echo "=============================="
echo "3. Install GIT"
echo "=============================="
yum install git -y
sleep 10
git clone https://github.com/DEVOPS-WITH-WEB-DEV/Splunk_Grafana_Setup.git
sleep 10

echo
echo
echo

# Install Java

echo "=============================="
echo "4. Install Java"
echo "=============================="
yum install java -y
sleep 15
echo "==== Java Installed ======="
echo "Java Version:"
java --version
echo "=============================="

echo
echo
echo

# Install Maven

echo "=============================="
echo "5. Install Maven"
echo "=============================="

cd /opt/
wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar xvzf  apache-maven-3.6.3-bin.tar.gz
touch /etc/profile.d/maven.sh
 
echo "export MAVEN_HOME=/opt/apache-maven-3.6.3" >> /etc/profile.d/maven.sh
echo "export PATH=$PATH:$MAVEN_HOME/bin" >> /etc/profile.d/maven.sh

export MAVEN_HOME=/opt/apache-maven-3.6.3
export PATH=$PATH:$MAVEN_HOME/bin

echo "==== Maven Installed ======="
echo "Maven Version:"
mvn -v
echo "=============================="


echo
echo
echo

# Install Jenkins

echo "=============================="
echo "6. Install Jenkins"
echo "=============================="

cd /opt/
sudo yum update -y
sleep 10
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sleep 10
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key 
sleep 10
sudo yum install jenkins -y
sleep 10 
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins --no-pager
echo "==== Jenkins Installed ======="
echo "Jenkins Version:"
jenkins --version
echo "=============================="

echo
echo
echo

# Install Docker

echo "=============================="
echo "7. Install Docker"
echo "=============================="

yum install docker -y
sleep 10
usermod -aG docker jenkins
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker --no-pager

echo "==== Docker Installed ======="
echo "Docker Version:"
docker --version
echo "=============================="

echo
echo
echo

# Install Kubectl

echo "=============================="
echo "7. Install Kubectl"
echo "=============================="

curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl
sleep 10
chmod +x ./kubectl
mkdir -p $HOME/bin
cp ./kubectl $HOME/bin/kubectl
export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
source $HOME/.bashrc

echo "==== KubeCTL Installed ======="
echo "KubeCTL Version:"
kubectl version --short --client
echo "=============================="

echo
echo
echo

# Install eksctl 

echo "=============================="
echo "8. Install EKSCTL"
echo "=============================="

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sleep 10
sudo mv /tmp/eksctl /usr/bin

echo "==== EKSCTL Installed ======="
echo "EKSCTL Version:"
eksctl version
echo "=============================="

echo
echo
echo

# Install Node/NPM

echo "=============================="
echo "9. Install NodeJS"
echo "=============================="

sudo yum install nodejs -y
sleep 10

echo "==== NodeJs Installed ======="
echo "Node Version:"
node -v
echo "NPM Version:"
npm -v
echo "=============================="