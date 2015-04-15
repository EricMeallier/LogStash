#!/bin/bash

/opt/logstash/bin/logstash -f /opt//logstash.conf&

/opt/elasticsearch/bin/elasticsearch&

nohup /opt/kibana/bin/kibana&

while :; do  sleep `echo "scale=2;$(( $RANDOM % 100))/100" | bc`;  echo $RANDOM >> /tmp/toto$(($RANDOM % 10)).log; done

# /bin/bash
