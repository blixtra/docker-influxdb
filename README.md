Docker InfluxDB
===============

Dockerfile and helper files for building an InlfuxDB image.

Mostly taken from tutumcloud/tutum-docker-influxdb

This Dockerfile does not, by default, create a persistant volume. You can either use "-v /data" when using run or, preferably, have a devoted volume container and use the "--from-volumes {volume-container-name}" option in the run command.

For example:

```
docker run -v /data --name influx-volume busybox

docker run --volumes-from influx-volume --name influxdb-master blixtra/influxdb
```

