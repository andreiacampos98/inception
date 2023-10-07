#https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
# creating a base OS image
FROM debian:bullseye

RUN apt update
RUN apt upgrade -y

# Install wordpress
RUN apt install wget -y
RUN apt install php7.4 php-fpm php-mysql mariadb-client -y
RUN wget https://wordpress.org/wordpress-6.3.1.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.3.1.tar.gz && rm wordpress-6.3.1.tar.gz
COPY ./conf/wp-config.php /var/www/html/
RUN chown -R root:root /var/www/html

# Configure php to work with wordpress
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir -p /run/php

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

RUN apt install curl -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

# create server root dir
COPY ./conf/wp-config.php /tmp/
# copying wordpress-setup.sh to the container
COPY ./tools/create_wordpress.sh /tmp/

ENTRYPOINT ["sh", "/tmp/create_wordpress.sh"]