service mariadb start
mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
mariadb -uroot -e "CREATE USER IF NOT EXISTS \`${db_user}\`@'localhost' IDENTIFIED BY '${db_pwd}';"
mariadb -uroot -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO \`${db_user}\`@'%' IDENTIFIED BY '${db_pwd}';"
mariadb -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${db_root_pwd}';FLUSH PRIVILEGES;"
mariadb-admin -uroot -p$db_root_pwd --wait-for-all-slaves shutdown

#sleep infinity 
mysqld_safe 
#mysqld_safe is typically used to start the MySQL server when the system is booting.
#and it is used also to start and stop the MySQL server manually.