#!/bin/bash

while read line; do
  projecteddate=$(awk '{print $1}' <<< $line)
  projectedamt=$(awk '{print $2}' <<< $line)
  projecteddate_sec=$(date --date $projecteddate +%s%N)
  echo "ledger,prediction_date=2021-12-20,current_projection=tag2 assets=${projectedamt},income=43i $projecteddate_sec"
done < /var/tmp/ledger_2021-12-30_18/ledgeroutput_current_projection.tmp
