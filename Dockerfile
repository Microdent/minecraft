FROM ubuntu

MAINTAINER Microdent "dengquan@deng-quan.com"

EXPOSE 19132 19133

RUN apt-get update
RUN apt-get install -y wget unzip curl
RUN mkdir /home/minecraft
RUN touch error.log

WORKDIR /home/minecraft

RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.1.4.zip && \
    unzip bedrock-server-1.14.1.4.zip && \
    rm -rf bedrock-server-1.14.1.4.zip

ENTRYPOINT nohup sh -c 'LD_LIBRARY_PATH=. ./bedrock_server' > error.log 2>&1
