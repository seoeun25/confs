# druid

## examples
druid tutorial (tutorial-examples.tar.gz) 의 example

var 디렉토리 아래에 indexing 결과를 저장. 테스트 후 삭제 reset 가능
bin/node.sh 를 이용하여 start
log 디렉토리에 log 파일 생김
metastore는 derby

* conf
* spec
    * wikipedia-index.json
    * wkkipedia-index-hadoop.json
* query
    * wikipedia-top-pages.json

## 0.12.3

## single

```
$ bin/single.sh coordinator overlord historical middleManager broker router

```

## Remote Agent 셋팅 (with IntelliJ)
1. Druid Process를 실행할 때 다음과 같이 Option 을 추가하여 실행한다. 

broker jvm.config
```
-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8882
```

2. IntelliJ 에서 Remote 실행 추가
Run --> Configuration 추가 --> Command Line Option 에 다음과 같이 추가한 후 실행 

```
-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8882
```

    