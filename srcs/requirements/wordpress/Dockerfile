FROM debian:bullseye
EXPOSE 9000

RUN apt update
RUN apt upgrade -y

# Install wordpress
RUN apt install wget -y
RUN apt install php7.4 php-fpm php-mysql mariadb-client -y
RUN wget https://wordpress.org/wordpress-6.3.1.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.3.1.tar.gz && rm wordpress-6.3.1.tar.gz
COPY ./conf/wp-config.php /var/www/wordpress/
RUN chown -R root:root /var/www/wordpress

# Configure php to work with wordpress
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir -p /run/php

# Configure wordpress using wp cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp_setup.sh /tmp/

ENTRYPOINT [ "sh", "/tmp/wp_setup.sh" ]
