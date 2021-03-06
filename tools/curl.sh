#!/bin/bash

ferrors=0
ffish=0

function fetch_recipe() {
  ri=`printf "%03d\n" $1` # create zer0 padded index
  # cut end to only show the last characters
  length=${#l}
  startindx=$(expr $length - 20)
  # echo "start $startindx end $length"
  echo "curl [..]${l:$startindx:$length} > $ri.html ..."
  curl $l 2>/dev/null > html/$ri.html
  # debug
  # echo "$l" > html/$ri.html

  if grep -q "friendly error page" "html/$ri.html"; then
    echo "[!] friendly error (retry) num=$ri"
    ferrors=$((ferrors + 1))
    sleep 30
    fetch_recipe $1 #recursive call
    # cat html/$ri.html
  fi

  if grep -q "<html><head></head><body><script>" "html/$ri.html"; then
    echo "[!] fishy content spottet num=$ri"
    ffish=$((ffish + 1))
    sleep 5
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

line_num=0
while read l; do
  line_num=$((line_num + 1))
  if [ "$line_num" -le $load ]; then
    echo "skipping $line_num"
    continue
  fi
  i=$((i + 1))
  fetch_recipe $i
  mod=$((i % 5))
  if [ $mod -eq 0 ]
  then
    echo "Chillin' to avoid getting blocked"
    sleep 5
  fi
  sleep 3
done < urls.txt

echo "-------- finished --------"
echo "friendly errors: $ferrors"
echo "fishy pages: $ffish"
echo "start at: $load"
echo "stop at: $i"
echo "total lines: $line_num"
