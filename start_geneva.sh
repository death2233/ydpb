#!/bin/bash
# 克隆仓库
sudo git clone https://github.com/death2233/ydpb /root/ydpb
chmod 777 /root/ydpb/*.sh

# 安装依赖
yum install -y python3 python3-devel gcc gcc-c++ git libnetfilter* libffi-devel
pip3 install --upgrade pip
pip3 install scapy netfilterqueue

# 默认开放 80 443 如果要开放其他端口请自行添加
iptables -A OUTPUT -p tcp --sport 80 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
iptables -A INPUT -p tcp --dport 80 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
iptables -A OUTPUT -p tcp --sport 443 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
iptables -A INPUT -p tcp --dport 443 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100

# 启动脚本
nohup python3 /root/ydpb/geneva.py -q 100 -w 4 > geneva.log 2>&1 &

echo "Geneva启动中..."
