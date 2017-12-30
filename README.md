# kotod-docker
A docker image for the Koto Cryptocurrency, which start off on December 2017 in Japan.
You just need to run "docker build ./ -t kotod"

### you can tip me some coins if you like my scripts
Monacoin: M9VkYEVo59mQUsWt9tRDfNi6b9SBNqMSyz

BitZeny: ZgD57J2vDBTBcSXgg814Fr8MrgNqpyC3n6

# How to run after installing
### server use
docker run -v /your_path_to/docker_kotod/.koto:/root/.koto -p 8433:8433 --name kotod --rm -d kotod kotod
### if you just curious to see what it looks like when it run on non-daemon mode
docker run -v /your_path_to/docker_kotod/.koto:/root/.koto -p 8432:8432 --name kotod --rm -it kotod /bin/bash
### surgical mode
docker run -v your_path_to/docker_kotod/.koto:/root/.koto -p 8432:8432 --name kotod --rm -it kotod kotod

### when you need to use JSON RPC interface:
docker run -v your_path_to/docker_kotod/.koto:/root/.koto --rm --name kotocli kotod koto-cli -rpcconnect=?????? -rpcport=???? [your desired RPC command and operands]
