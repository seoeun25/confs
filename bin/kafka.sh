#!/usr/bin/env bash

KAFKA_HOME=/usr/local/kafka
BIN=$KAFKA_HOME/bin
CONF=$KAFKA_HOME/config


export KAFKA_LOG_DIR=$KAFKA_HOME/logs

echo "kafka $1"

case "$1" in
  start)
        $BIN/kafka-server-start.sh $CONF/server.properties &
        exit 0
        ;;
  stop)
        $BIN/kafka-server-stop.sh
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|" >&2
        exit 3
        ;;
esac
exit 6
