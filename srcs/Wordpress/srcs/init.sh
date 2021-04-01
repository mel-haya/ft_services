rc-service nginx start
php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.conf
tail -f /dev/null