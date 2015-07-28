FROM ubuntu

RUN apt-get update && \
    apt-get install -y wget &&\
    apt-get clean

ENV INFLUX_VERSION 0.9.2

RUN wget https://s3.amazonaws.com/influxdb/influxdb_${INFLUX_VERSION}_amd64.deb && \
    dpkg -i influxdb_${INFLUX_VERSION}_amd64.deb && \
    rm influxdb_${INFLUX_VERSION}_amd64.deb

RUN mkdir -p /influxdb_backup/
ADD crontab /etc/crontab
RUN chmod 644 /etc/crontab

EXPOSE 8086
EXPOSE 8083

VOLUME /influxdb_backup/

CMD cron; /opt/influxdb/influxd
