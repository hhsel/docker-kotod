### kotod server docker image
# you can tip me some coins:
# Monacoin: M9VkYEVo59mQUsWt9tRDfNi6b9SBNqMSyz
# BitZeny: ZgD57J2vDBTBcSXgg814Fr8MrgNqpyC3n6

# running koto as daemon
# docker run -v /Users/hhsel/Projects/Docker/kotod/.koto:/root/.koto -p 8433:8433 --name kotod --rm -d kotod kotod

FROM            ubuntu:16.04
MAINTAINER H.HSEL

# install dependencies
RUN apt-get update && apt-get upgrade -y && \
        apt-get install -y \
                build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev \
                unzip git python python-zmq zlib1g-dev wget bsdmainutils automake curl && \
    rm -rf /var/lib/apt/lists/*

# build koto
RUN cd && mkdir tmp && cd tmp && \
	git clone https://github.com/koto-dev/koto.git && \
	cd koto && \
	./zcutil/fetch-params.sh && \
	./zcutil/build.sh --disable-rust -j$(nproc)

# install binaries and delete all temporary files
RUN cd /root/tmp/koto/src &&  \
	cp kotod /usr/local/bin && \
	cp koto-cli /usr/local/bin && \
	cp koto-tx /usr/local/bin && \
	rm -rf /tmp
