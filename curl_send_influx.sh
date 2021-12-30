org=my-org
bucket=my-bucket
token=my-super-secret-auth-token
curl --request POST \
"http://192.168.0.15:8086/api/v2/write?org=${org}&bucket=${bucket}&precision=ns" \
  --header "Authorization: Token $token" \
  --header "Content-Type: text/plain; charset=utf-8" \
  --header "Accept: application/json" \
  --data-binary '
    airSensors,sensor_id=TLM0201 temperature=73.97038159354763,humidity=35.23103248356096  1640830110000000000
    airSensors,sensor_id=TLM0202 temperature=75.30007505999716,humidity=35.651929918691714 1640830156000000000
    ledger,prediction_date=20211220,current_projection=tag2 assets=163145.0,income=43i     1640822400000000000
    ledger,prediction_date=20211220,current_projection=tag2 assets=246077.0,income=43i     1672358400000000000
    ledger,prediction_date=20211220,current_projection=tag2 assets=329009.0,income=43i     1703894400000000000
    ledger,prediction_date=20211220,current_projection=tag2 assets=411941.0,income=43i     1735516800000000000
    ledger,prediction_date=20211220,current_projection=tag2 assets=494873.0,income=43i     1767052800000000000
    '
