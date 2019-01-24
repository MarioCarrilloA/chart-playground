# chart-playground

### Fm restful API

These are some instructions about how to build/run a container
to expose fm restful API.

#### build image

```
$ make
```

or if you are behind a proxy

```
$ make PROXY=<proxy URL>:<proxy port>
```

#### run the container

```
$ docker run -it -p 18002:18002 fm-rest-api:7.4
```

#### make a test

in another terminal you can make a resquest to the api
exposed by the container

```
$ curl http://localhost:18002
```
NOTE:

If you have any issue making this test, and you are behind a proxy, possibly
you will need to unset the HTTP proxy variable.

```
$ unset http_proxy
```

