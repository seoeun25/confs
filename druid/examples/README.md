# examples conf

druid tutorial (tutorial-examples.tar.gz) 의 example conf

# how to start druid

```
## PRE-REQUISIT
start zookeeper

$ cd DRUID_HOME
## config 를 수정하고 연결.
$ bin/coordinator.sh start
$ bin/overlord.sh start
$ bin/historical.sh start
$ bin/middleManager.sh start
$ bin/broker.sh start

## 확인 : 모든 Main 으로 뜸.
$ jps
$ Main
$ Main
$ Main
$ Main
$ Main

```