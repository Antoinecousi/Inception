#!bin/bash
sleep 2
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root \
                        --dbname=$SQL_DATABASE \
                        --dbuser=$SQL_USER \
                        --dbpass=$SQL_PASSWORD \
                        --dbhost=mariadb:3306 \
                        --path='/var/www/wordpress'

wp core install     --url=acousini.42.fr \
                    --title=acousini \
                    --admin_user=$CORE_USER \
                    --admin_password=$CORE_USER_PW \
                    --admin_email=$CORE_USER_EMAIL \
                    --allow-root \
                    --path='/var/www/wordpress'


wp user create      --role=author gpetit gpetit@example.com \
                    --user_pass=$OTHER_USER_PW \
                    --allow-root \
                    --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F