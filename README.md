The Main purpose is for following:

1. Financial Tracking / Forecasting
2. Food Tracking
3. 

Tech stack used is as follows:
1. Telegraph for collction of financial data
2. Adhock script for sending other metrics to influxdb
    a. Main System Disk Space
    b. Pizza eating
3. Influx db and prometheus
    a. Influx db for finance forecasting / Pizza
    b. Prometheus for Disk Space monitoring

```
telegraf --config telegraf.conf
```

# Influx flux query

```
from(bucket:"my-bucket")
  |> range(start: -1h)

```

```
from(bucket:"my-bucket")
  |> range(start: -3w, stop: 15y)
  |> filter(fn: (r) =>
    r._field == "assets"
  )
```


