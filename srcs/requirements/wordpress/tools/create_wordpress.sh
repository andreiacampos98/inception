#!/bin/bash

sleep 10;
# while ! nc -z "mariadb" "3306"; do
# 	sleep 1;
# done

# if [ -f "/var/www/html/wp-config.php" ]; then
# 	echo "${WP_URL} already created"
# else
	cp -f /tmp/wp-config.php /var/www/html/
	chmod 644 /var/www/html/wp-config.php;
	# create administrator
	wp core install --url="anaraujo.42.fr" --title="inception" --admin_name="anaraujo --admin_email="andreiacampos98.15@gmail.com --admin_password="12345" --allow-root
	# Create user
	wp user create "andreia" "anaraujo@student.42porto.com" --user_pass="1234" --allow-root
# fi

service php7.3-fpm start;
service php7.3-fpm stop;

php-fpm7.3 -F -R;