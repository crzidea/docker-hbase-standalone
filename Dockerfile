FROM openjdk:jre

ENV HBASE_VERSION=1.2.6

RUN wget --quiet https://www.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz && \
    tar xzf hbase-$HBASE_VERSION-bin.tar.gz && \
    mv hbase-$HBASE_VERSION hbase && \
    rm hbase-$HBASE_VERSION-bin.tar.gz

WORKDIR /var/lib/hbase
ENV HBASE_LOG_DIR=logs
ADD ./conf/hbase-site.xml /hbase/conf/hbase-site.xml
ADD ./docker-entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh

EXPOSE 2181
EXPOSE 16010
EXPOSE 16020
EXPOSE 16030
