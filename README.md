# minecraft
use docker to implement minecraft service

How to run: 
```bash
docker run -d --restart=always --name=minecraft -v /home/minecraft_d/server.properties:/home/minecraft/server.properties -v /home/minecraft_d/whitelist.json:/home/minecraft/whitelist.json -v /home/minecraft_d/worlds:/home/minecraft/worlds -p 19132:19132/udp -p 19133:19133/udp microdent/minecraft
```

Or you can use this shell script:
```bash
wget https://github.com/Microdent/minecraft/raw/master/minecraft.sh && chmod +x minecraft.sh && ./minecraft.sh
```
