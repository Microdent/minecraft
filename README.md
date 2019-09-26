# minecraft
use docker to implement minecraft service

How to run: 
```bash
docker run -d --restart=always --name=minecrafte -v /home/MCS/server.properties:/home/mincecraft/server.properties -v /home/MCS/whitelist.json:/home/minecraft/whitelist.json -v /home/MCS/worlds:/home/minecraft/worlds -p 19132:19132 microdent/minecraft
```
