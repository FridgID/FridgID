#!/bin/bash

ferrors=0

function fetch_recipe() {
  ri=`printf "%03d\n" $1` # create zer0 padded index
  # cut end to only show the last characters
  length=${#l}
  startindx=$(expr $length - 20)
  # echo "start $startindx end $length"
  echo "curl [..]${l:$startindx:$length} > $ri.html ..."
  curl $l 2>/dev/null > html/$ri.html

  if grep -q "friendly error page" "html/$ri.html"; then
    echo "[!] friendly error (retry) num=$ri"
    ferrors=$((ferrors + 1))
    sleep 30
    fetch_recipe $1 #recursive call
    # cat html/$ri.html
  fi
}


echo "fetching all recipes..."
i=`ls html | wc -l`
i=$((i))
if [ $i -eq 1 ];then
  echo "loaded one -> overwrite it"
  i=0
elif [ $i -gt 1 ]; then
  echo "loaded index=$i"
  i=$((i - 2))
  echo "refresh last index=$i"
fi
load=$i

while read l; do
  i=$((i + 1))
  fetch_recipe $i
  mod=$((i % 5))
  if [ $mod -eq 0 ]
  then
    echo "Chillin' to avoid getting blocked"
    sleep 5
  fi
  # sleep 5
done <urls.txt

echo "-------- finished --------"
echo "friendly errors: $ferrors"
echo "start at: $load"
echo "total: $i"
