# minecraft
use docker to implement minecraft service

How to run: docker run -d --restart=always --name=minecrafte -v /home/MCS/server.properties:/home/mincecraft/server.properties -v /home/MCS/whitelist.json:/home/minecraft/whitelist.json -v /home/MCS/worlds:/home/minecraft/world -p 19132:19132 microdent/minecraft
