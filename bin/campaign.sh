#!/usr/bin/env bash

CAMPAIGN_HUB_HOME=/usr/local/campaign-hub
BIN=$CAMPAIGN_HUB_HOME/bin

echo CAMPAIGN_HUB_HOME=$CAMPAIGN_HUB_HOME

echo "campaign $1"

case "$1" in
  start)
	$BIN/campaign.sh start
        exit 0
        ;;
  status)
	$BIN/campaign.sh status
        exit 0
        ;;
  stop)
        $BIN/campaign.sh stop
        exit 0
        ;;
  *)
        echo "Usage: $0 start|stop|" >&2
        exit 3
        ;;
esac
exit 6
