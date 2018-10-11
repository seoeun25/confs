#!/usr/bin/env bash

LIB_HOME=/usr/local
USER_HOME=/Users/seoeun
BIN=$USER_HOME/bin

case "$1" in
  start)
        echo "hadoop start ......"
	$BIN/hadoop-start.sh
	echo "zookeeper start ......"
	$BIN/zookeeper.sh start
        exit 0
        ;;
  stop)
        echo "hadoop stop ......"
        $BIN/hadoop-stop.sh
	echo "zookeeper stop ......"
	$BIN/zookeeper.sh stop
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|" >&2
        exit 3
        ;;
esac
exit 6


## zookeeper


## hadoop
/usr/local/hadoop/sbin/start-all.sh 
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver

## 

