#!/bin/bash

influx_db_data_file=/var/tmp/ledger_sent_to_influxdb_$(date +\%Y_\%m_\%d-\%H\%M\%S)

while read line; do
  projecteddate=$(awk '{print $1}' <<< $line)
  projectedamt=$(awk '{print $2}' <<< $line)
  projecteddate_sec=$(date --date $projecteddate +%s%N)
  echo "ledger,prediction_date=2021-12-20,current_compound=tag2 assets=${projectedamt},income=43i $projecteddate_sec" >> $influx_db_data_file
done < /var/tmp/ledger_2021-12-30_18/ledgeroutput_current_compound.tmp

org=my-org
bucket=my-bucket
token=my-super-secret-auth-token
curl --request POST \
"http://192.168.0.26:8086/api/v2/write?org=${org}&bucket=${bucket}&precision=ns" \
  --header "Authorization: Token $token" \
  --header "Content-Type: text/plain; charset=utf-8" \
  --header "Accept: application/json" \
  --data-binary "@$influx_db_data_file"
