#!/usr/bin/env bash

ZK_WEB_HOME=/Users/seoeun/mywork/zookeeper/zk-web

echo "zk-web $1"

case "$1" in
  start)
        cd $ZK_WEB_HOME
	lein deps &
	lein run &
        exit 0
        ;;
  stop)
        echo "jps and find main "
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|" >&2
        exit 3
        ;;
esac
exit 6
