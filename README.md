# 操作系统限制 centos 7.7 7.6

## 移动防屏蔽机器 一键安装、开机启动、定时任务命令
```bash
curl -o /root/start_geneva.sh https://raw.githubusercontent.com/death2233/ydpb/master/start_geneva.sh && chmod +x /root/start_geneva.sh && echo "@reboot /root/start_geneva.sh" >> /etc/crontab && echo "0 */1 * * * root /root/start_geneva.sh" > /etc/cron.d/restart_geneva
```

## 命令执行完毕后，出现下图所示，则执行成功！
![image](https://github.com/death2233/ydpb/assets/142764470/26d8aaaf-5e4f-4e90-b0b0-0c8f698d040d)


## <span style="color:red">如果运行了上面的命令，则下面的三条命令不需要执行。以下是三条分开执行的命令：</span>

## 1.安装脚本

```bash
curl -o /root/start_geneva.sh https://raw.githubusercontent.com/death2233/ydpb/master/start_geneva.sh && chmod +x /root/start_geneva.sh && /root/start_geneva.sh
```

## 2.添加到开机启动项
```bash
echo "@reboot /root/start_geneva.sh" >> /etc/crontab
```

## 3.创建定时任务，每隔1小时重新启动脚本
```bash
echo "0 */1 * * * root /root/start_geneva.sh" > /etc/cron.d/restart_geneva
```


## 以下为添加8080端口的命令，如需添加其他端口，需要替换命令中相应的端口号

```bash
iptables -A OUTPUT -p tcp --sport 8080 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
iptables -A INPUT -p tcp --dport 8080 --tcp-flags SYN,RST,ACK,FIN,PSH SYN,ACK -j NFQUEUE --queue-num 100
```

## 查看已经打开的端口
```bash
iptables -L-n
```
