# 操作系统限制 centos 7.7 7.6

## 一键安装、开机启动、定时任务命令
```bash
curl -o /root/start_geneva.sh https://raw.githubusercontent.com/death2233/ydpb/master/start_geneva.sh && chmod +x /root/start_geneva.sh && echo "@reboot /root/start_geneva.sh" >> /etc/crontab && echo "0 */1 * * * root /root/start_geneva.sh" > /etc/cron.d/restart_geneva
```

## 以下为三条命令分开执行：

## 安装脚本

```bash
curl -o /root/start_geneva.sh https://raw.githubusercontent.com/death2233/ydpb/master/start_geneva.sh && chmod +x /root/start_geneva.sh && /root/start_geneva.sh
```

## 添加到开机启动项
```bash
echo "@reboot /root/start_geneva.sh" >> /etc/crontab
```

## 创建定时任务，每隔1小时重新启动脚本
```bash
echo "0 */1 * * * root /root/start_geneva.sh" > /etc/cron.d/restart_geneva
```



