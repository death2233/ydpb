#!/bin/bash

pid=$(pgrep -f "geneva.py")

# 检查进程是否在运行
if [ -n "$pid" ];
then
    echo "geneva.py 正在运行. PID: $pid"
else
    echo "geneva.py 未在运行. 正在尝试重新启动..."
    # 在此处添加重新启动命令，例如：
    nohup python3 /root/ydpb/geneva.py -q 100 -w 25 &
    pid=$(pgrep -f "geneva.py")
    echo "geneva.py 正在运行. PID: $pid"
fi
