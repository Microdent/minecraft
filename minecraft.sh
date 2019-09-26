#!/bin/bash
# 作者：Microd
# 版本：1.0
# 日期：9/26/2019
# 功能：安装Microdent的Minecraft私服
clear
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

echo -e "+----------------------------------------------------------------------+"
echo -e "|${red}Welcome to use Microd's shell script${none}                                  |"
echo -e "|${yellow}Version: 1.0${none}                                                          |"
echo -e "|${magenta}Author: Microd${none}                                                        |"
echo -e "|${cyan}Website: https://blog.deng-quan.com${none}                                   |"
echo -e "+----------------------------------------------------------------------+"

echo -e "${yellwo}We can do below：${none}"
echo -e "${green}1.Install Docker
2.Initialize the MineCraft settings
3.Download MineCraft Server and start
4.Just start Minecraft Server(Please confirm that you already have Microdent/minecraft server)
5.Stop Minecraft Server
6.Restart Minecrafte Server
7.Uninstall Minecraft Server(This option will also remove Docker)${none}"

read -p "Choose your choice:(input num 1~7)：" choose

if [ $choose = 1 ];
  then
  apt-get update -y
  apt-get -y install docker.io
  echo  -e "${green}Install Docker successfully!${none}"
elif [ $choose == 2 ];
  then
  rm -rf /home/minecraft_d
  mkdir /home/minecraft_d
  touch /home/minecraft_d/server.properties
  echo -e "server-name=Dedicated Server
gamemode=creative
difficulty=easy
allow-cheats=true
max-players=10
online-mode=true
white-list=true
server-port=19132
server-portv6=19133
view-distance=32
tick-distance=4
player-idle-timeout=30
max-threads=8
level-name=My World
level-seed=
default-player-permission-level=member
texturepack-required=false
content-log-file-enabled=false
" > /home/minecraft_d/server.properties
  touch /home/minecraft_d/whitelist.json
  echo -e "[
{
    \"ignoresPlayerLimit\": false,
    \"name\": \"Microdent\"
},
{
    \"ignoresPlayerLimit\": false,
    \"name\": \"ClivilC\",
}
]" > /home/minecraft_d/whitelist.json
  mkdir /home/minecraft_d/worlds
  echo  -e "${green}Initialize the MineCraft settings successfully!${none}"
elif [ $choose == 3 ];
  then
  docker run -d --restart=always --name=minecraft -v /home/minecraft_d/server.properties:/home/minecraft/server.properties -v /home/minecraft_d/whitelist.json:/home/minecraft/whitelist.json -v /home/minecraft_d/worlds:/home/minecraft/worlds -p 19132:19132/udp -p 19133:19133/udp microdent/minecraft
  echo  -e "${green}Download MineCraft Server and start successfully!${none}"
elif [ $choose == 4 ];
  then
  docker start minecraft
  echo  -e "${green}Start Minecraft Server successfully!${none}"
elif [ $choose == 5 ];
  then
  docker stop minecraft
  echo  -e "${green}Stop MineCraft Server successfully!${none}"
elif [ $choose == 6 ];
  then
  docker restart minecraft
  echo  -e "${green}Restart MineCraft Server successfully!${none}"
elif [ $choose == 7 ];
  then
  docker stop minecraft
  docker rm minecrafte
  docker rmi microdent/minecraft
  apt-get -y remove docker.io
  rm -rf /home/minecraft_d
  echo  -e "${green}Uninstall MineCraft Server successfully!${none}"
else
  then
  echo  -e "${red}Input Error!${none}"
fi
 
 echo  -e "${green}Microd's Blog: https://blog.deng-quan.com${none}"
