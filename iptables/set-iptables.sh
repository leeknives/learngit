#!/bin/bash
#设置服务器的防火墙规则

#1清空Filter表中所有的防火墙规则
iptables -F
iptables -X
iptables -Z

#2添加防火墙规则
#设定预设规则
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

#对内网用户不设防
iptables -A INPUT -m iprange --src-range 124.114.149.138-124.114.149.142 -j ACCEPT
iptables -A INPUT -m iprange --src-range 124.115.17.130-124.115.17.190 -j ACCEPT
iptables -A INPUT -m iprange --src-range 10.10.10.2-10.10.10.255 -j ACCEPT

#设置打开的端口80
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p udp --dport 161 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT

#service iptables save
#service iptables restart
