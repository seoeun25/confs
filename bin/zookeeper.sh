#!/usr/bin/env bash

ZOOKEEPER_HOME=/usr/local/zookeeper
BIN=$ZOOKEEPER_HOME/bin

export ZOO_LOG_DIR=$ZOOKEEPER_HOME/logs

echo "zookeeper $1"

case "$1" in
  start)
        $BIN/zkServer.sh start
        exit 0
        ;;
  stop)
        $BIN/zkServer.sh stop
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|" >&2
        exit 3
        ;;
esac
exit 6
