FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y install openjdk-7-jre

RUN apt-get -y install wget bc

EXPOSE 9200 80

RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -P /tmp
RUN tar zxvf /tmp/logstash-1.4.2.tar.gz -C /tmp
RUN rm -f /tmp/logstash-1.4.2.tar.gz
RUN ln -s /tmp/logstash-1.4.2 /tmp/logstash
ADD conf/ /tmp/conf

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz -P /tmp
RUN tar zxvf /tmp/elasticsearch-1.1.1.tar.gz -C /tmp
RUN rm -f /tmp/elasticsearch-1.1.1.tar.gz
RUN ln -s /tmp/elasticsearch-1.1.1 /tmp/elasticsearch

RUN apt-get -y install lighttpd

RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz -P /tmp
RUN tar xfv /tmp/kibana-3.1.2.tar.gz -C /var/www

CMD /tmp/conf/launch.sh

