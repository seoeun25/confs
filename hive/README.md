# metastore 용 mysql 셋팅

mysql의 사용자 만들기

```
mysql> CREATE USER 'hive'@'%' IDENTIFIED BY 'hive';
mysql> grant all privileges on *.* to 'hive'@'%';
mysql> CREATE USER 'hive'@'localhost' IDENTIFIED BY 'hive';
mysql> grant all privileges on *.* to 'hive'@'localhost';
mysql> FLUSH PRIVILEGES;

```

# metastore 미리 만들기

* mysql에서 hive metastore용 database를 미리 생성한다
* hive/scripts/metastore/upgrade/mysql/ 에서 hive-schema-2.2.0.mysql.sql 와 같은 sql 파일을 찾는다
```
$ cd hive/scripts/metastore/upgrade/mysql
$ mysql -u hive -p (mysql 접속)
mysql> create database hive;
mysql> use hive;
mysql> source hive-schema-2.2.0.mysql.sql;
```

# metastore service start

[https://cwiki.apache.org/confluence/display/Hive/AdminManual+MetastoreAdmin]

```aidl
$ hive --service metastore &
```
