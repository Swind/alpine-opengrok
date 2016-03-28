# alpine-opengrok

## Build

Download the latest opengrok.

``` bash
wget http://java.net/projects/opengrok/downloads/download/opengrok-0.12.1.5.tar.gz
```

Build

``` bash
docker build
```

## Run

Create `docker-compose.yml`

``` yaml
drprophet:
  image: <image name>
  volumes:
    - <the source code or project path>:/src
  ports:
    - 8080:8080
```

Run

``` bash
docker-compose up
```



