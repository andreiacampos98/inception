wp core install --url="$DOMAIN_NAME"\
				--title="$WP_TITLE" \
				--admin_user="$WP_ADMIN_USER" \
				--admin_password="$WP_ADMIN_PASSWORD" \
				--admin_email="$WP_ADMIN_EMAIL" \
				--skip-email \
				--path='/var/www/wordpress' \
				--allow-root
wp user create "$WP_USER" "$WP_USER_EMAIL" \
				--user_pass="$WP_USER_PASSWORD" \
				--role=author \
				--path='/var/www/wordpress' \
				--allow-root
/usr/sbin/php-fpm7.4 -F