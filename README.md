# 操作系统限制 centos 7.7 7.6

## 一键脚本

```bash
curl -o /root/start_geneva.sh https://raw.githubusercontent.com/death2233/ydpb/master/start_geneva.sh && chmod +x /root/start_geneva.sh && /root/start_geneva.sh
```

## 添加到开机启动项
```echo "@reboot /root/start_geneva.sh" >> /etc/crontab
```

## 创建定时任务，每隔1小时重新启动脚本
```echo "0 */1 * * * root /root/start_geneva.sh" > /etc/cron.d/restart_geneva
```

## 以上三条命令整合成一条
```curl -o /root/start_geneva.sh https://raw.githubusercontent.com/death2233/ydpb/master/start_geneva.sh && chmod +x /root/start_geneva.sh && echo "@reboot /root/start_geneva.sh" >> /etc/crontab && echo "0 */1 * * * root /root/start_geneva.sh" > /etc/cron.d/restart_geneva
```

