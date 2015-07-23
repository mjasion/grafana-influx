FROM ubuntu
RUN apt-get update && \
    apt-get install -y wget &&\
    apt-get clean

RUN wget https://s3.amazonaws.com/influxdb/influxdb_0.9.1_amd64.deb && \
    dpkg -i influxdb_0.9.1_amd64.deb && \
    rm influxdb_0.9.1_amd64.deb
RUN mkdir -p /influxdb_backup/
ADD crontab /etc/crontab
RUN chmod 644 /etc/crontab

EXPOSE 8086
EXPOSE 8083

VOLUME /influxdb_backup/

CMD cron; /opt/influxdb/influxd
