FROM alpine

RUN apk -U add python py2-pip

ARG CURATOR_VERSION=5.8.1

RUN pip install elasticsearch-curator==${CURATOR_VERSION}

RUN /usr/bin/crontab /config/run-curator

CMD ["/usr/sbin/crond","-f"]
