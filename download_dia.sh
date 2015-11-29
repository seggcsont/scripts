#!/bin/bash

id=$1
index=$2
pattern=$3

url_pattern=http://dia.osaarchivum.org/public/filmstrips/$id/$pattern
curl -O -f `printf $url_pattern $index` 2> /dev/null
while [ $? -eq 0 ]; do
  echo $index. dia letöltve!
  index=`expr $index + 1`
  url=`printf $url_pattern $index`
  curl -O -f $url 2> /dev/null
done
