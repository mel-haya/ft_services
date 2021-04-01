process=`ps | grep grafana-server|grep -v grep|wc -l`;

if [ $process -eq 1 ]
then exit 0
else exit 1
fi
