#!/bin/sh

cd /src/ffmpeg
pwd
emconfigure ./configure \
    --cc="emcc" \
    --cxx="em++" \
    --ar="emar" \
    --prefix=/dist \
    --enable-cross-compile \
    --target-os=none \
    --arch=x86_64 \
    --cpu=generic \
    --disable-avdevice \
    --disable-swresample \
    --disable-postproc \
    --disable-avfilter \
    --disable-programs \
    --disable-everything \
    --enable-avformat \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-asm \
    --disable-devices \
    --enable-network \
    --enable-protocol=http,https,tcp \
    --disable-hwaccels \
    --disable-parsers \
    --disable-bsfs \
    --disable-debug \
    --disable-indevs \
    --disable-outdevs \
    --disable-encoders \
    --enable-encoder=aac \
    --disable-decoders \
    --enable-decoder=aac \
    --enable-decoder=hevc \
    --disable-demuxers \
    --enable-demuxer=aac \
    --enable-demuxer=flv \
    --enable-demuxer=hevc \
    --disable-muxers \
    --enable-muxer=flv \
    --disable-doc
make clean
make && make install
