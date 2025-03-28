#!/usr/bin/env bash

for npub in $(cat npubs.txt); do
  npubshort=$(echo -n $npub | grep -o ^npub1................)
  mkdir -p $npubshort
  pubkey=$(nak decode $npub | jq -r .pubkey)
  for relay in $(cat relays.txt); do
    filename=$npubshort/$npubshort.$relay.jsons
    if [ ! -e $filename ]; then
      nak req -k 1 -l 30000 --paginate --paginate-interval 10s \
        -a $pubkey $relay | tee $filename
    fi
  done
done
