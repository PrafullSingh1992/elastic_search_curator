echo "remote_aws_key ${remote_aws_key}"
echo "remote_aws_key ${remote_aws_secret_key}"

FROM amazon/opendistro-for-elasticsearch:1.2.0

ENV AWS_ACCESS_KEY_ID ${remote_aws_key}
ENV AWS_SECRET_ACCESS_KEY {remote_aws_secret_key}



RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch repository-s3
RUN /usr/share/elasticsearch/bin/elasticsearch-keystore create

RUN echo $AWS_ACCESS_KEY_ID | /usr/share/elasticsearch/bin/elasticsearch-keystore add --stdin s3.client.default.access_key
RUN echo $AWS_SECRET_ACCESS_KEY | /usr/share/elasticsearch/bin/elasticsearch-keystore add --stdin s3.client.default.secret_key



FROM alpine

RUN apk -U add python py2-pip

ARG CURATOR_VERSION=5.8.1

RUN pip install elasticsearch-curator==${CURATOR_VERSION}

COPY config/* /etc/curator/
COPY run-curator /usr/bin/

ENTRYPOINT ["/usr/bin/run-curator"]
