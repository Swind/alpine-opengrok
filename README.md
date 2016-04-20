# alpine-opengrok

## Build

``` bash
docker build
```

## Run

1. Create `docker-compose.yml`

``` yaml
drprophet:
  image: <image name>
  volumes:
    - <the source code or project path>:/src
  ports:
    - 8080:8080
```

2. Run

``` bash
docker-compose up
```
