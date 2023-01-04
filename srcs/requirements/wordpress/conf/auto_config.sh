#!bin/bash
sleep 2
echo -e "YOYOYO!"
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root \
                        --dbname=$SQL_DATABASE \
                        --dbuser=$SQL_USER \
                        --dbpass=$SQL_PASSWORD \
                        --dbhost=mariadb:3306 \
                        --path='/var/www/wordpress'

sleep 2
echo -e "im here"

wp core install     --url=acousini.42.fr \
                    --title=acousini \
                    --admin_user=Nimda \
                    --admin_password=NimdaPass \
                    --admin_email=Nimda@unknown.com \
                    --allow-root \
                    --path='/var/www/wordpress'

echo -e "im here"

wp user create      --role=author gpetit gpetit@example.com \
                    --user_pass=gpetit42 \
                    --allow-root \
                    --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
    echo -e "mkdir ./run/php"
fi
echo -e "/usr/sbin/php-fpm7.3 -F"
/usr/sbin/php-fpm7.3 -F