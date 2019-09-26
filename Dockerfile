FROM ubuntu

MAINTAINER Microdent "dengquan@deng-quan.com"

EXPOSE 19132

RUN apt-get update
RUN apt-get install -y wget unzip curl
RUN mkdir /home/minecraft
RUN touch error.log

WORKDIR /home/minecraft

RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.1.1.zip
RUN unzip bedrock-server-1.12.1.1.zip
RUN rm -f server.properties white.json

ENTRYPOINT nohup sh -c 'LD_LIBRARY_PATH=. ./bedrock_server' > error.log 2>&1
