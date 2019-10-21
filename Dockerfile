FROM alpine

RUN apk -U add python py2-pip

ARG CURATOR_VERSION=5.8.1

RUN pip install elasticsearch-curator==${CURATOR_VERSION}

COPY config/* /home/ubuntu/elkstack/mn-1/curator/
COPY run-curator /home/ubuntu/elkstack/mn-1/

CMD ["/home/ubuntu/elkstack/mn-1/run-curator","-f"]
