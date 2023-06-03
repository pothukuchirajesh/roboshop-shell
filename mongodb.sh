cp mongodb.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org -y

echo -e "\e[33mupdate MongoDB Listen Address\e[0m"

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.log

systemctl enable mongod
systemctl restart mongod
