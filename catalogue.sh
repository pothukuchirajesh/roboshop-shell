curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
cp /home/centos/roboshop-shell/ctalogue.service /etc/system/catalogue.service

systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo

yum install mongodb-org-shell -y
mongo --host mongodb-dev.devops73.site </app/schema/catalogue.js