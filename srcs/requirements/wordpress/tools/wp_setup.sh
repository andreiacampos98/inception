wp core install --url="$DOMAIN_NAME"\
				--title="$WP_TITLE" \
				--admin_user="$WP_ADMIN_USR" \
				--admin_password="$WP_ADMIN_PWD" \
				--admin_email="$WP_ADMIN_EMAIL" \
				--skip-email \
				--path='/var/www/wordpress' \
				--allow-root
wp user create "$WP_USR" "$WP_EMAIL" \
				--user_pass="$WP_PWD" \
				--role=author \
				--path='/var/www/wordpress' \
				--allow-root
/usr/sbin/php-fpm7.4 -F
