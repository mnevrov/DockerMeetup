FROM docker.t8.ru/astra-se:1.7.5

RUN apt-get update && apt-get install -y git wget flex bison autoconf libtool g++ gdb build-essential libssl-dev

RUN wget http://sensor-dist.t8.ru/distr/cmake-3.25.3.tar.gz \
    && tar -xzf cmake-3.25.3.tar.gz \
    && cd cmake-3.25.3/ \
    && ./bootstrap --parallel=$(nproc) \
    && make -j$(nproc) && make install

RUN wget --quiet http://sensor-dist.t8.ru/distr/libpcap-1.10.5.tar.gz \
    && tar -xzf libpcap-1.10.5.tar.gz \
    && cd libpcap \
    && ./autogen.sh \
    && ./configure --enable-dbus=no --enable-shared=no \
    && make -j$(nproc) && make install

RUN wget --quiet http://sensor-dist.t8.ru/distr/PcapPlusPlus-24.09.tar.gz \
    && tar -xzf PcapPlusPlus-24.09.tar.gz \
    &&  mkdir -p PcapPlusPlus/build \
    && cd PcapPlusPlus/build \
    && cmake -DPCAPPP_BUILD_EXAMPLES=OFF -DPCAPPP_BUILD_TESTS=OFF -DPCAPPP_BUILD_TUTORIALS=OFF .. \
    && make -j$(nproc) && make install