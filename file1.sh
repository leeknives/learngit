# 先用dos2unix转换下格式。
# http://blog.linuxhomes.cn/archives/259/

#!/bin/bash
# mysql全量备份脚本

mkdir /backup
cd /backup
dateDIR=`date +"%y-%m-%d"`
mkdir -p $dateDIR/data
path=/usr/local/mysql/data
for i in `mysql -uroot -p123456 -e "show databases" | grep -v "Database"`
do
  mysqldump -uroot -p123456 --default-character-set=gbk --opt $i | gzip > /backup/$dateDIR/data/${i}_${dateDIR}.sql.gz
done

mysqladmin -uroot -p123456 flush-logs
binlog_rm=`tail -n 1 $path/mysql-bin.index | sed 's/.\///'`
mysql -uroot -p123456 -e "purge binary logs to '$binlog_rm'"