#!/bin/bash

# 安装依赖
yum install -y python3 python3-devel gcc gcc-c++ git libnetfilter* libffi-devel
pip3 install --upgrade pip
pip3 install scapy netfilterqueue

REPO_DIR="/root/ydpb"

# 检查仓库是否存在
if [ -d "$REPO_DIR" ]; then
    # 仓库存在，执行 git pull 来更新
    cd "$REPO_DIR" || exit
    git pull
else
    # 仓库不存在，执行 git clone
    sudo git clone https://github.com/death2233/ydpb "$REPO_DIR"
fi

# 授予执行权限
chmod 777 "$REPO_DIR"/*.sh

# 默认开放 80 443 如果要开放其他端口请自行添加
iptables -A OUTPUT -p tcp --sport 80 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
iptables -A INPUT -p tcp --dport 80 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
iptables -A OUTPUT -p tcp --sport 443 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
iptables -A INPUT -p tcp --dport 443 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100

# 启动脚本
"$REPO_DIR"/check_process.sh

echo "start_geneva 执行完毕..."
