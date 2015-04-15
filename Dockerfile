FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y install openjdk-7-jre

RUN apt-get -y install wget bc

EXPOSE 9200 80

RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -P /tmp
RUN tar zxvf /tmp/logstash-1.4.2.tar.gz -C /opt
RUN rm -f /tmp/logstash-1.4.2.tar.gz
RUN ln -s /opt/logstash-1.4.2 /opt/logstash
ADD conf/ /tmp/conf

RUN wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.1.tar.gz -P /tmp
RUN tar zxvf /tmp/elasticsearch-1.5.1.tar.gz -C /opt
RUN rm -f /opt/elasticsearch-1.5.1.tar.gz
RUN ln -s /opt/elasticsearch-1.5.1 /opt/elasticsearch

RUN apt-get -y install nginx

RUN wget https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz -P /tmp
RUN tar xfv /tmp/kibana-4.0.2-linux-x64.tar.gz -C /opt
RUN ln -s /opt/kibana-4.0.2-linux-x64 /opt/kibana

# RUN firewall-cmd --zone=public --add-port=9090/tcp

CMD /tmp/conf/launch.sh

