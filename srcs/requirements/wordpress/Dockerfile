# creating a base OS image
FROM debian:bullseye

# installing wordpress
# https://make.wordpress.org/hosting/handbook/server-environment/#system-packages
RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*

# setting the right conf file for php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

# create server root dir
COPY ./conf/wp-config.php /tmp/
# copying wordpress-setup.sh to the container
COPY ./tools/create_wordpress.sh /tmp/

CMD ["/bin/bash", "/tmp/create_wordpress.sh"]