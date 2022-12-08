#!/bin/bash
#redis-server


workDir=/home/youmi/Software/redis-5.0.14/src

start(){
    cd ${workDir}
    pwd > ../redis-server.nohup
    nohup ./redis-server >> ../redis-server.nohup 2>&1 &
}

stop(){
    cd ${workDir}
    ps -o ruser=userForLongName -e -o pid,ppid,c,time,cmd |grep redis-server | grep -v grep | grep $USER | awk '{print $2}' | xargs kill
}

case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
esac
