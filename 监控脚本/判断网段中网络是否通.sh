дһ���ű���ʵ���ж�192.168.1.0/24�������ǰ���ߵ�IP����Щ����pingͨ����Ϊ����



for ip in `seq 1 25`
do
        {
        ping -c 1 192.168.1.$ip > /dev/null 2>&1
        if [ $? -eq 0 ]; then
                echo 192.168.1.$ip UP
        else
                echo 192.168.1.$ip DOWN
        fi
        }&

done
wait