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
mkdir -p docker_dir/
pushd docker_dir/
docker run -d -p 8086:8086 \
      -v $PWD/data:/var/lib/influxdb2 \
      -v $PWD/config:/etc/influxdb2 \
      -e DOCKER_INFLUXDB_INIT_MODE=setup \
      -e DOCKER_INFLUXDB_INIT_USERNAME=my-user \
      -e DOCKER_INFLUXDB_INIT_PASSWORD=my-password \
      -e DOCKER_INFLUXDB_INIT_ORG=my-org \
      -e DOCKER_INFLUXDB_INIT_BUCKET=my-bucket \
      -e DOCKER_INFLUXDB_INIT_RETENTION=10y \
      -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=my-super-secret-auth-token \
      influxdb
popd

telegraf --config telegraf.conf
```

# Influx flux query

```
from(bucket:"my-bucket")
  |> range(start: -10h)
  |> filter(fn: (r) =>
    r._field == "i" and r._measurement == "example_mycollector" and r.tag1 == "a"
  )
```

```
from(bucket:"my-bucket")
  |> range(start: -10h)
  |> filter(fn: (r) =>
    r._field == "temperature"
  )
```


