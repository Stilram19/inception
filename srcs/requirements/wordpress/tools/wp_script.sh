#!/bin/sh

sleep 10

# create the wordpress config file and setting config infos

cat wp-config-sample.php > wp-config.php
sed -i "s/username_here/$MDB_USER/g" wp-config.php
sed -i "s/password_here/$MDB_PASSWORD/g" wp-config.php
sed -i "s/localhost/$MDB_HOSTNAME/g" wp-config.php
sed -i "s/database_name_here/$MDB_DATABASE/g" wp-config.php

wp core install --allow-root \
	--url=localhost \
	--title="My WordPress Site" \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=bednaouiomar19@gmail.com

wp user create --allow-root $WP_USER aminekhallofi@gmail.com --user_pass=$WP_USER_PASSWORD --role=editor

# running the fast cgi process manager in the foreground

echo "php-fpm starting!"

php-fpm7.4 -F -R

echo "php-fpm failed!"
