process=`ps | grep -E "nginx: master|php-fpm: master process"|grep -v grep|wc -l`;

if [ $process -eq 2 ]
then exit 0
else exit 1
fi
