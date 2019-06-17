FROM ubuntu:18.04

RUN apt-get update -qq && apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  closure-compiler \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libglib2.0-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  pkg-config \
  texinfo \
  wget \
  zlib1g-dev \
  python2.7 \
  python2.7-dev \
  nodejs

RUN mkdir /src /dist
VOLUME /dist

WORKDIR /src
RUN git clone https://github.com/emscripten-core/emsdk.git
WORKDIR /src/emsdk
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 10
RUN git pull
RUN ./emsdk install latest
RUN ./emsdk activate latest
ENV PATH "$PATH:/src/emsdk:/src/emsdk/fastcomp/emscripten:/src/emsdk/node/8.9.1_64bit/bin"

WORKDIR /src
RUN git clone https://github.com/ksvc/FFmpeg.git ffmpeg
WORKDIR /src/ffmpeg
RUN git reset --hard origin/release/3.4

COPY build.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/build.sh
ENTRYPOINT ["build.sh"]

