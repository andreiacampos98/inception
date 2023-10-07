#!/bin/bash

mysql_install_db;
service mysql start;

# Configure database
if [ -f /var/lib/mysql/${db_name} ]
	echo "${db_name} already created"
then
	# creating database
	mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${db_name};"
	# creating user DB_USER %
	mariadb -u root -e "CREATE USER IF NOT EXISTS '${db_user}'@'%' IDENTIFIED BY '${db_pwd}';"
	mariadb -u root -e "GRANT ALL ON ${db_name}.* TO '${db_user}'@'%' IDENTIFIED BY '${db_pwd}';"
	mariadb -u root -e "FLUSH PRIVILEGES;"
	# creating user db_user local
	mariadb -u root -e "CREATE USER IF NOT EXISTS '${db_user}'@'localhost' IDENTIFIED BY '${db_pwd}';"
	mariadb -u root -e "GRANT ALL ON ${db_name}.* TO '${db_user}'@'localhost' IDENTIFIED BY '${db_pwd}';"
	mariadb -u root -e "FLUSH PRIVILEGES;"
	echo "${db_name} created database"
	
	mariadb -u root -e "CREATE TABLE ${db_name}.todo_list (item_id INT AUTO_INCREMENT, content VARCHAR(255), PRIMARY KEY(item_id));"
	mariadb -u root -e "INSERT INTO ${db_name}.todo_list (content) VALUES ('My first task, yay');"
	mariadb -u root -e "INSERT INTO ${db_name}.todo_list (content) VALUES ('Second task, gimme more');"
	mariadb -u root -e "INSERT INTO ${db_name}.todo_list (content) VALUES ('Last task i promise');"
	mariadb -u root -e "INSERT INTO ${db_name}.todo_list (content) VALUES ('one more task');"
fi

service mysql stop;
mysqld;