/etc/init.d/mariadb start

echo "CREATE DATABASE wp_db;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'pma'@'%' IDENTIFIED BY '123';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'%' IDENTIFIED BY '123';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mariadb < create_tables.sql
mariadb < wp_db.sql

tail -f /dev/null