FROM ubuntu

MAINTAINER Microdent "dengquan@deng-quan.com"

EXPOSE 19132

RUN apt update
RUN apt install wget
RUN apt install unzip
RUN mkdir /home/minecraft
RUN touch error.log

WORKDIR /home/minecraft

RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.1.1.zip
RUN unzip bedrock-server-1.12.1.1.zip

ENTRYPOINT nohup LD_LIBRARY_PATH=. ./bedrock_server > error.log 2>&1 &
