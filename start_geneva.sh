#!/bin/bash

# 安装依赖
yum install -y python3 python3-devel gcc gcc-c++ git libnetfilter* libffi-devel
pip3 install --upgrade pip
pip3 install scapy netfilterqueue

# 启动脚本
nohup python3 /root/ydpb/geneva.py -q 100 -w 4 > geneva.log 2>&1 &

echo "Geneva启动中..."