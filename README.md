# confs

hadoop, spark 등의 opensource component의 configuration 저장

다음의 일반적인 default configuration directory외 symlink 연결해서 사용 가능.

/etc/hadoop
/etc/spark/conf
/etc/oozie/conf
/etc/hive/conf

## master branch
sembp 노트북 기준

## azra branch
se 노트북 기준

# Install hadoop
Hadoop Home 을 /usr/local 로 한다면,

```
$ cd /usr/local
$ tar -xvf hadoop-2.7.3.tar.gz

```

Edit environment
.bash_profile 을 수정
```
HADOOP_HOME="/usr/local/hadoop"
PATH=$PATH:$HIVE_HOME/bin:$HADOOP_HOME/bin
```

# Install Spark
Spark Home을 /usr/local/spark로 한다면,

```
$ cd /usr/local
$ tar xvf spark-2.1.1-bin-hadoop2.7.tgz
$ ln -s spark-2.1.1-bin-hadoop2.7 spark
``` 

.bash_profile 수정
```aidl
SPARK_HOME="/usr/local/spark"
PATH=$PATH:$HIVE_HOME/bin:$HADOOP_HOME/bin:$SPARK_HOME/bin:$OOZIE_HOME/bin
```