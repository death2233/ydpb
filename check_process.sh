#!/bin/bash

# 检查进程是否在运行
if pgrep -f "geneva.py" > /dev/null
then
    echo "geneva.py 正在运行."
else
    echo "geneva.py 未在运行. 正在尝试重新启动..."
    # 在此处添加重新启动命令，例如：
     nohup python3 /root/ydpb/geneva.py -q 100 -w 4 &
fi