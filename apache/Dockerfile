# 
# Dockerfile LAMP Apache
# 
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y

# Add php repo
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update

# Linux utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    curl \
    vim \ 
    net-tools \
    zip \
    unzip \
    wget

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	php7.3 \
    php7.3-bcmath \
	php7.3-bz2 \
	php7.3-cgi \
	php7.3-cli \
	php7.3-common \
	php7.3-curl \
	php7.3-dev \
	php7.3-enchant \
	php7.3-fpm \
	php7.3-gd \
	php7.3-gmp \
	php7.3-imap \
	php7.3-interbase \
	php7.3-intl \
	php7.3-json \
	php7.3-ldap \
	php7.3-mbstring \
	php7.3-mysql \
	php7.3-odbc \
	php7.3-opcache \
	php7.3-pgsql \
	php7.3-phpdbg \
	php7.3-pspell \
	php7.3-readline \
	php7.3-recode \
	php7.3-snmp \
	php7.3-sqlite3 \
	php7.3-sybase \
	php7.3-tidy \
	php7.3-xmlrpc \
	php7.3-xsl \
	php7.3-zip

# Fix fpm run dir
RUN mkdir -p /run/php

# Install composer after php
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y composer

# Install apache web server
RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 libapache2-mod-php7.3 -y
RUN a2enmod rewrite
RUN a2enmod headers

# Install mariadb
RUN DEBIAN_FRONTEND=noninteractive apt-get install mariadb-common mariadb-server mariadb-client -y

# Install smtp mail server
RUN DEBIAN_FRONTEND=noninteractive apt-get install postfix -y

EXPOSE 80
EXPOSE 443
EXPOSE 3306
EXPOSE 22
