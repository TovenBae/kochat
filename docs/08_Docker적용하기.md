## 8. Docker 적용하기
### 8.1 Dockerfile 생성
root 폴더에 Dockerfile, .dockerignore 파일 생성

**Dockerfile**
```
FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime
# LABEL MAINTAINER sunghan.bae@bjsystems.kr
WORKDIR /apps
ADD requirements.txt ./
ADD . ./
RUN apt-get -y -qq update && \
    pip install -r requirements.txt
# CMD python demo/application.py
```


**.dockerignore**
```
node_modules
npm-debug.log
```

### 8.2 Docker image build
```
docker build -t kochat-dev .
```

### 8.3 Docker image 실행
```
docker run -i --rm -v c:/data/git/kochat:/apps kochat-dev
docker run -i -v c:/data/git/kochat:/apps kochat-dev
```

### 8.4 Docker container log 확인
```
$ docker logs funny_merkle  <-- container name임
```

### 8.5 Docker container 접속
```
furtur2@DESKTOP-OOIVN4C MINGW64 /c/data/git/kochat (master)
$ docker ps -a
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                      PORTS     NAMES
c7b0f488c7b8   kochat-dev     "/bin/sh -c 'python …"   32 minutes ago   Exited (1) 32 minutes ago             funny_merkle
7609ae0f6ba0   redis          "docker-entrypoint.s…"   2 months ago     Exited (0) 2 months ago               sleepy_borg
83ee21ff87c5   ubuntu:16.04   "/bin/bash"              2 months ago     Exited (0) 5 weeks ago                inspiring_heyrovsky
(kochat)
furtur2@DESKTOP-OOIVN4C MINGW64 /c/data/git/kochat (master)
$ docker exec -it c7b0f488c7b8 /bin/bash
the input device is not a TTY.  If you are using mintty, try prefixing the command with 'winpty'
(kochat)
$ winpty docker exec -it c7b0f488c7b8 /bin/bash

```