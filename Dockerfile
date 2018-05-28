FROM openjdk:jre

ENV HBASE_VERSION=1.2.6

RUN wget https://www.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz && \
    tar xzf hbase-$HBASE_VERSION-bin.tar.gz && \
    mv hbase-$HBASE_VERSION hbase && \
    rm hbase-$HBASE_VERSION-bin.tar.gz

WORKDIR /var/lib/hbase

ADD ./conf/hbase-site.xml /hbase/conf/hbase-site.xml

CMD /hbase/bin/start-hbase.sh
