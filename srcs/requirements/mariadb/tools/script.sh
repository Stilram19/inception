#!/bin/sh

service mariadb start

# sleep for a short time to ensure that MariaDB service has started

sleep 1

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MDB_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${MDB_USER}\`@'localhost' IDENTIFIED BY '${MDB_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MDB_DATABASE}\`.* TO \`${MDB_USER}\`@'%' IDENTIFIED BY '${MDB_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"

# flushing all previous changes

mysql -u root -p$MDB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# restarting the server as the main process

exec mysqld_safe
