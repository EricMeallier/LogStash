#!/bin/bash

/tmp/logstash/bin/logstash -f /tmp/conf/logstash.conf&

/tmp/elasticsearch/bin/elasticsearch&

service lighttpd start

while :; do  sleep `echo "scale=2;$(( $RANDOM % 100))/100" | bc`;  echo $RANDOM >> /tmp/toto$(($RANDOM % 10)).log; done

# /bin/bash
