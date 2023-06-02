cp mongodb.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org -y
## modify the config file
systemctl enable mongod
systemctl restart mongod
