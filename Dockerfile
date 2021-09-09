FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime
# LABEL MAINTAINER sunghan.bae@bjsystems.kr
WORKDIR /demo
ADD requirements.txt ./
ADD . ./
RUN apt-get -y -qq update && \
    pip install -r requirements.txt
CMD python application.py