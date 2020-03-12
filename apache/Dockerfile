#
# LAMP Dockerfile Apache
# @author Gustavo Novaro
# @version 1.0.5
# Check syntax with online linter: https://www.fromlatest.io/
# https://github.com/gnovaro/docker-lamp
#
FROM ubuntu:18.04
LABEL Description="LAMP" Vendor="Roskus" version="1.0.5"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
#RUN apt-get upgrade -y

# Add common
RUN apt-get install software-properties-common -y

# Add php repo
RUN add-apt-repository ppa:ondrej/php -y

# Let’s Encrypt repository
RUN add-apt-repository ppa:certbot/certbot -y

# Update repos
RUN apt-get update

# Linux utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	curl \
	git \
	htop \
	mc \
	net-tools \
	openssl \
	supervisor \
	unzip \
	vim \
	wget \
	zip

# TimeZone
RUN apt-get install -y tzdata

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
	php7.3-soap \
	php7.3-sqlite3 \
	php7.3-sybase \
	php7.3-tidy \
	php7.3-xmlrpc \
	php7.3-xsl \
	php7.3-zip

# Fix fpm run dir
RUN mkdir -p /run/php
# php.ini
#COPY .conf/php.ini /etc/php/7.3/apache2/php.ini

# Install php pear PECL
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-pear

# Install composer after php
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y composer

# Install apache web server
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 libapache2-mod-php7.3 libapache2-mod-security2
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod cache
RUN a2enmod expires
RUN a2enmod ssl
RUN a2enmod proxy

# Default config for mod_security
RUN cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf

# Install cerbot
#RUN DEBIAN_FRONTEND=noninteractive app-get install certbot -y

# Install mariadb
RUN DEBIAN_FRONTEND=noninteractive apt-get install mariadb-common mariadb-server mariadb-client -y

# Install smtp mail server
RUN DEBIAN_FRONTEND=noninteractive apt-get install postfix -y

# Install Dovecot (MDA, Mail Deliver Agent)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-imapd dovecot-pop3d

# Config supervisor
COPY ./conf/supervisord.conf /etc/supervisor/supervisord.conf

# Php config
#COPY ./conf/php.ini /etc/php/7.3/fpm/php.ini

# Run supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
