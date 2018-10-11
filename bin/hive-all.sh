#!/usr/bin/env bash

HIVE_HOME=/usr/local/hive
BIN=$HIVE_HOME/bin


echo "hive-all $1"

case "$1" in
  start)
	echo "hive --service metastore &"
        hive --service metastore &
	#echo "hive server2"
	#hiveser2 &
        exit 0
        ;;
  stop)
        echo "ps -ef | grep hive"
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|" >&2
        exit 3
        ;;
esac
exit 6
