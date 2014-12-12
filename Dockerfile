FROM ubuntu:trusty
MAINTAINER Chris Kühl <chris@endocode.com>
# Moslty taken from the tutum-docker-influxdb

RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

# Install InfluxDB
RUN curl -s -o /tmp/influxdb_latest_amd64.deb http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb && \
  dpkg -i /tmp/influxdb_latest_amd64.deb && \
  rm /tmp/influxdb_latest_amd64.deb && \
  rm -rf /var/lib/apt/lists/*

# Files
ADD config.toml /config/config.toml
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Admin server
EXPOSE 8083

# HTTP API
EXPOSE 8086

# HTTPS API
EXPOSE 8084

# Raft port
EXPOSE 8090

# Protobuf port
EXPOSE 8099

CMD ["/run.sh"]
