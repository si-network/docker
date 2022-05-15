FROM php:7.4-apache

COPY store.conf /etc/apache2/sites-available

WORKDIR /

RUN apt-get update && \
	apt-get install -y git && \
	mkdir -p /var/www/html/store && \
	# Клонирование репозитория
	git clone https://github.com/si-network/online-store /var/www/html/store && \
	docker-php-ext-install pdo_mysql && \
	a2enmod rewrite && \
	a2ensite store && \
	apt install -y zip unzip && \
	# Установка Composer
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
	php composer-setup.php && \
	php -r "unlink('composer-setup.php');" && \
	mv composer.phar /usr/local/bin/composer && \
	cd /var/www/html/store && \
	# Установка зависимостей через Composer
	composer install && \
	# Установка пользователя каталогов проекта www-data, как у модуля Apache
	chown -R  www-data /var/www/html/store && \
	chmod -R 700 /var/www/html/store