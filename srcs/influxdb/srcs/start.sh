mkdir -p /var/run/
touch  /var/run/utmp
nohup influxd run &
influx -execute "create database telegraf"
influx -execute "CREATE USER melhaya WITH PASSWORD '123' WITH ALL PRIVILEGES"
./telegraf-1.18.0/usr/bin/telegraf
tail -f /dev/null