#!/usr/bin/env bash

CAMPAIGN_HOME=/usr/local/campaign-hub
BIN=$CAMPAIGN_HOME/bin

echo "campaign-hub $1"

case "$1" in
  start)
	$BIN/campaign.sh start
	sleep 1
	echo ""
        exit 0
        ;;
  stop)
        $BIN/campaign.sh stop
        exit 0
        ;;
  status)
        $BIN/campaign.sh status
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|status" >&2
        exit 3
        ;;
esac
exit 6
