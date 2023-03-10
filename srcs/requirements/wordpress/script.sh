#!/bin/bash
 
mkdir /var/www/
mkdir /var/www/html
cd /var/www/html


wget https://wordpress.org/latest.tar.gz 
tar -xvzf latest.tar.gz 
mv wordpress/* .
rm latest.tar.gz
 
 sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
 curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
 chmod +x wp-cli.phar

 mv wp-cli.phar /usr/local/bin/wp

 mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

 sed -i "s/database_name_here/$DATABASE_NAME/1" wp-config.php
 sed -i "s/username_here/$DATABASE_USER_NAME/1" wp-config.php
 sed -i "s/password_here/$DATABASE_USER_PASS/1" wp-config.php
 sed -i "s/localhost/$DATABASE_HOST/1" wp-config.php

 wp core download --allow-root

 wp core install --url=$wp_site --title=$wp_title --admin_user=$wp_user_a --admin_password=$wp_pass_a --admin_email=$wp_email_a --allow-root
 wp user create $wp_user $wp_email --role=author --user_pass=$wp_pass --display_name=$wp_user --allow-root
/usr/sbin/php-fpm7.3 -F
