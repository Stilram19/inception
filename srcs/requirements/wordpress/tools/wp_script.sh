#!/bin/sh

sleep 2

# create the wordpress config file and setting config infos
wp config create --allow-root \
	--dbname=$MDB_DATABASE \
	--dbuser=$MDB_USER \
	--dbpass=$MDB_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'

# running the fast cgi process manager in the foreground
php-fpm7.4 -F
