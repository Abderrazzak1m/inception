#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" > file.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PASS';" >> file.sql
echo "CREATE USER IF NOT EXISTS '$DATABASE_USER_NAME'@'%' IDENTIFIED BY '$DATABASE_USER_PASS';" >> file.sql
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER_NAME'@'%';" >> file.sql
echo "FLUSH PRIVILEGES;" >> file.sql

mysql < file.sql
killall mysqld
exec $@