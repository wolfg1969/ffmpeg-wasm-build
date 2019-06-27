```
$ mkdir src dist
$ cd src
$ git clone https://github.com/ksvc/FFmpeg.git ffmpeg
$ cd ffmpeg
$ git reset --hard origin/release/3.4
$ cd ../..
$ docker build  . -t ffmpeg-wasm-build
$ docker run --rm --volume=$(pwd)/src:/src --volume=$(pwd)/dist:/dist ffmpeg-wasm-build
```

