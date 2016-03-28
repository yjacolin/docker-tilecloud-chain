# Tilecloud-chain

## Install

$ git clone
$ docker build -t yjacolin/tilecloud-chain .

## Run tilecloud-chain

Get help:
```
$ docker run --rm -ti yjacolin/tilecloud-chain
```

Seed google layer from config.yaml file:
```
$ docker run --rm -ti yjacolin/tilecloud-chain -c /tilecloud-chain/config.yaml -l google
```