FROM ubuntu
RUN apt-get update && \
    apt-get install -y wget libfontconfig &&\
    apt-get clean

RUN wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.1.0-pre1_amd64.deb && \
    dpkg -i grafana_2.1.0-pre1_amd64.deb && \
    rm grafana_2.1.0-pre1_amd64.deb

ADD grafana.ini /etc/grafana/grafana.ini

EXPOSE 3000
CMD ["/usr/sbin/grafana-server", "-homepath=/usr/share/grafana/", "-config=/etc/grafana/grafana.ini"]
