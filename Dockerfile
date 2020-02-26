FROM alpine

RUN apk -U add python py2-pip

ARG CURATOR_VERSION=5.8.1
RUN pip install wheel
RUN pip install elasticsearch-curator==${CURATOR_VERSION}

COPY config/* /etc/curator/
COPY run-curator /usr/bin/

ENTRYPOINT ["/usr/bin/run-curator"]
