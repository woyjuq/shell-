#!/bin/bash
ps -eo pid,user,ppid,%mem,%cpu,cmd --sort=-%mem | head | tail -n +2 | awk '{print $1}' > /tmp/long-running-processes-1.txt
echo "--------------------------------------------------"
echo "UName     PID  CMD          Process_Running_Time"
echo "--------------------------------------------------"
for userid in `cat /tmp/long-running-processes-1.txt`
do
username=$(ps -u -p $userid | tail -1 | awk '{print $1}')
pruntime=$(ps -p $userid -o etime | tail -1)
ocmd=$(ps -p $userid | tail -1 | awk '{print $4}')
echo "$username $userid $ocmd $pruntime"
done | column -t
echo "--------------------------------------------------"