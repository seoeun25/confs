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

    