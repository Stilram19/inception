#!/bin/sh

sleep 10

# create the wordpress config file and setting config infos
#wp config create --allow-root \
#	--dbname=$MDB_DATABASE \
#	--dbuser=$MDB_USER \
#	--dbpass=$MDB_PASSWORD \
#	--dbhost=mariadb:3306 \
#	--path='/var/www/wordpress'

cat wp-config-sample.php > wp-config.php
sed -i "s/username_here/$MDB_USER/g" wp-config.php
sed -i "s/password_here/$MDB_PASSWORD/g" wp-config.php
sed -i "s/localhost/$MDB_HOSTNAME/g" wp-config.php
sed -i "s/database_name_here/$MDB_DATABASE/g" wp-config.php

#echo "data base name $MDB_DATABASE\n"
#echo "user $MDB_USER\n"
#echo "password $MDB_PASSWORD"

#ping mariadb

if [ $? -eq 0 ]; then
	echo "exit_sucess"
else
	echo "exit_failure"
fi

#while true
#do
#	sleep 2
#done

# running the fast cgi process manager in the foreground

echo "php-fpm starting!"

php-fpm7.4 -F

echo "php-fpm failed!"
