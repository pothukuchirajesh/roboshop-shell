curl -sL https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshop.log

yum install nodejs -y  &>>/tmp/roboshop.log

useradd roboshop  &>>/tmp/roboshop.log
rm -rf /app  &>>/tmp/roboshop.log

mkdir /app  &>>/tmp/roboshop.log

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>/tmp/roboshop.log
cd /app

unzip /tmp/catalogue.zip  &>>/tmp/roboshop.log
cd /app

npm install  &>>/tmp/roboshop.log
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service  &>>/tmp/roboshop.log

systemctl daemon-reload  &>>/tmp/roboshop.log
systemctl enable catalogue  &>>/tmp/roboshop.log
systemctl start catalogue  &>>/tmp/roboshop.log

cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo  &>>/tmp/roboshop.log

yum install mongodb-org-shell -y  &>>/tmp/roboshop.log

mongo --host mongodb-dev.devops73.site </app/schema/catalogue.js  &>>/tmp/roboshop.log