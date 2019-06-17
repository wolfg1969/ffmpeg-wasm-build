```
$ docker build  . -t ffmpeg-wasm-build
$ docker run --rm --volume=$(pwd)/dist:/dist ffmpeg-wasm-build
```

