#!/usr/bin/env bash
for npub in $(cat npubs.txt); do
  npubshort=$(echo -n $npub | grep -o ^npub1................)
  for file in $npubshort/*.jsons; do
    touch tmpb.csv
    if [ -s $file ]; then
      cat $file | jq -r '[.created_at, .id] | @csv' \
        | sort -n -r > tmpa.csv
      cat tmpa.csv tmpb.csv | sort -n -r -u > tmpc.csv
      rm -f tmpa.csv tmpb.csv
      mv -f tmpc.csv tmpb.csv
    fi
    mv -f tmpb.csv $npubshort/withtimestamp.csv
    cut -d, -f2 $npubshort/withtimestamp.csv | sed 's/"//g' \
      > $npubshort/ids.txt
  done
done
