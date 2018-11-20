#!/bin/bash

echo "fetching all recipes"

i=0
while read l; do
  i=$((i + 1))
  ri=`printf "%03d\n" $i` # create zer0 padded index
  # cut end to only show the last characters
  length=${#l}
  startindx=$(expr $length - 20)
  # echo "start $startindx end $length"
  echo "curl [..]${l:$startindx:$length} > $ri.html ..."
  curl $l 2>/dev/null > html/$ri.html
  mod=$((i % 20))
  if [ $mod -eq 0 ]
  then
    echo "Chillin' to avoid getting blocked"
    sleep 60
  fi
  sleep 5 # sleep 1 second anyways
done <urls.txt
