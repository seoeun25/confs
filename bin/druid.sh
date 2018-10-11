#!/usr/bin/env bash

DRUID_HOME=/usr/local/druid
BIN=$DRUID_HOME/bin

# export ZOO_LOG_DIR=$ZOOKEEPER_HOME/logs

echo "druid $1"

case "$1" in
  start)
	$BIN/coordinator.sh start
	sleep 1
	echo ""
	$BIN/overlord.sh start
	sleep 1
	echo ""
	$BIN/historical.sh start
	sleep 1
	echo ""
	$BIN/middleManager.sh start
	sleep 1
	echo ""
	$BIN/broker.sh start
        exit 0
        ;;
  stop)
        $BIN/broker.sh stop
        $BIN/middleManager.sh stop
        $BIN/historical.sh stop
        $BIN/overlord.sh stop
        $BIN/coordinator.sh stop
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|" >&2
        exit 3
        ;;
esac
exit 6
