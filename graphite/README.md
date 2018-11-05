# graphite

## docker를 이용하여 설치

https://graphite.readthedocs.io/en/latest/install.html#docker

```aidl
docker login 이 안되었다면, 먼저 login
$ dokcer login
$ docker run -d --name graphite --restart=always -p 80:80 -p 2003-2004:2003-2004 -p 2023-2024:2023-2024 -p 8125:8125/udp -p 8126:8126 graphiteapp/graphite-statsd

docker 확인
$ docker ps

```

web: http://localhost:80 에서 확인
    