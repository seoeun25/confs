#!/bin/bash

USAGE="-e Usage: oom_score.sh
     {coordinator|overlord|broker|historical}"
SERVER=$1
if [[ $SERVER == "" ]] ; then
    echo $USAGE
    exit 1
fi

echo "SERVER=$SERVER"
PID=`ps -ef | grep "io.druid.cli.Main server $SERVER" | grep /druid | awk '{print $2}'`
if [[ $PID == "" ]] ; then
    echo "Druid $SERVER is not running"
    exit 1
fi

echo "Druid $SERVER is running ($PID)"
echo -17 > /proc/$PID/oom_adj
echo "oom_adj:"
cat /proc/$PID/oom_adj
echo -1000 > /proc/$PID/oom_score_adj
echo "oom_score_adj:"
cat /proc/$PID/oom_score_adj

