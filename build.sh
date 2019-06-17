#!/bin/sh
cd /src/ffmpeg
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
    --enable-protocol=file \
    --disable-indevs \
    --disable-outdevs \
    --disable-encoders \
    --enable-encoder=aac \
    --disable-decoders \
    --enable-decoder=aac \
    --enable-decoder=h264 \
    --enable-decoder=hevc \
    --disable-demuxers \
    --enable-demuxer=aac \
    --enable-demuxer=mov \
    --enable-demuxer=mpegts \
    --enable-demuxer=flv \
    --enable-demuxer=h264 \
    --enable-demuxer=hevc \
    --enable-demuxer=hls \
    --disable-muxers \
    --enable-muxer=h264 \
    --enable-muxer=flv \
    --enable-muxer=f4v \
    --enable-muxer=mp4 \
    --disable-doc
make clean
make && make install
ls /dist

    
