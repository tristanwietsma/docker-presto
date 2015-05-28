FROM java:8

ENV DEBIAN_FRONTEND noninteractive

RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.105/presto-server-0.105.tar.gz
RUN mv presto-server-0.105.tar.gz presto.tar.gz

RUN mkdir /opt/presto
RUN tar -zxvf presto.tar.gz -C /opt/presto --strip-components=1
RUN rm presto.tar.gz

COPY config/* /opt/presto/etc/

RUN apt-get update && apt-get install -y python

EXPOSE 8080

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]
