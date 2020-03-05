#
# Lamp Dockerfile
# @author Gustavo Novaro
# @version 1.0.2
# Check syntax with online linter: https://www.fromlatest.io/
# https://github.com/gnovaro/docker-lamp
#
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt-get update

# Add php repo
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update

# Install linux utils
RUN apt-get install -y --no-install-recommends --no-install-suggests git vim htop mc supervisor curl zip unzip net-tools wget openssl

# Install webserver
RUN apt-get install -y nginx
RUN chown -R www-data:www-data /var/lib/nginx

# TimeZone
RUN apt-get install -y tzdata

# PHP and modules
RUN apt-get install -y \
	php7.4-common \
	php7.4-cli \
	php7.4-fpm \
	php7.4-dev \
	php7.4-bz2 \
	php7.4-curl \
	php7.4-gd \
	php7.4-intl \
	php7.4-json \
	php7.4-mbstring \
	php7.4-mysql \
	php7.4-zip \
	php7.4-xml \
	php7.4-dom \
	php7.4-iconv \
	php7.4-bcmath \
	php7.4-odbc \
	php7.4-soap \
	php7.4-sqlite3

# Fix fpm run dir
RUN mkdir -p /run/php

# Install php pear PECL
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-pear

# Install php composer
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y composer

# Install SMTP mail server
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

# Install MariaDB
RUN apt-get install -y mariadb-server mariadb-client

# Config supervisor
COPY ./conf/supervisord.conf /etc/supervisor/supervisord.conf

# Php config
COPY ./conf/php.ini /etc/php/7.4/fpm/php.ini

# Run supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
