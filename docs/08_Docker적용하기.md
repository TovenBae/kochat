## 8. Docker 적용하기
### 8.1 Dockerfile 생성
root 폴더에 Dockerfile, .dockerignore 파일 생성

**Dockerfile**
```
FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime
# LABEL MAINTAINER sunghan.bae@bjsystems.kr
WORKDIR /demo
ADD requirements.txt ./
ADD . ./
RUN apt-get -y -qq update && \
    pip install -r requirements.txt
CMD python application.py
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
docker run -i --rm -v c:/data/git/kochat/demo:/demo kochat-dev
```