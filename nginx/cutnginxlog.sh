#!/bin/sh

LOGPATH="/alidata/server/nginx-1.4.7/logs"
BAKPATH="/data/nginxlogbak"
for logname in `cat $LOGPATH/log.txt`;do
ACCESSLOG="${LOGPATH}/${logname}.access.log"
ERRORLOG="${LOGPATH}/${logname}.error.log"
DAY="$(date -d yesterday +%Y%m%d)"
scriptLog="${LOGPATH}/cut_nginx_log.log" #脚本自身的日志文件
if [ ! -f "$scriptLog" ];then
    touch "$scriptLog"
    date  '+%Y-%m-%d %H:%M:%S' >>${scriptLog}
fi
mkdir -p $LOGPATH/${logname}$DAY
mv $ACCESSLOG $LOGPATH/${logname}$DAY/${logname}.access_$DAY.log
mv $ERRORLOG $LOGPATH/${logname}$DAY/${logname}.error_$DAY.log
mkdir -p ${BAKPATH}/${DAY}
cd $LOGPATH
tar zcf ${logname}$DAY.tar.gz ${logname}$DAY/
mv ${logname}$DAY.tar.gz ${BAKPATH}/${DAY}
rm -rf ${logname}$DAY
done


kill -USR1 `cat /alidata/server/nginx/logs/nginx.pid`
