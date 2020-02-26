FROM python:3.6-alpine

ARG CURATOR_VERSION=5.8.1

RUN pip install  elasticsearch-curator==${CURATOR_VERSION} &&\
    rm -rf /var/cache/apk/*

COPY config/* /etc/curator/
COPY run-curator /usr/bin/

ENTRYPOINT ["/usr/bin/run-curator"]
