# devenv.sh Grafana & InfluxDB example boilerplate

This example boilerplate to use grafana and influxdb with devenv.sh.
Grafana and influxdb will be launched on `devenv up`.

## Grafana

Will be startet automaticly with `devenv up`.

### Admin UI

URL: `http://localhost:3000/`
Name: `admin`
Password: `admin`

### Configurate InfluxDB as datasource

Add InfluxDB datasource here `http://localhost:3000/connections/datasources`.
Use the following settings. All other settings can be leaved as default.  
Query language: `Flux`  
URL: `http://127.0.0.1:8086/`  
Organization: `predict`  
Token: `1QNm2IeLFILnRemdGjgAo2e38gwW95rVmaypwRaMTkVrAHKrEqf3NmS7k1D090WQ-MpdgCL5AlBS6Ax4X4uemg==`  
Default Bucket: `predict`

### Tabelle mit Graph

Sparkline
https://grafana.com/docs/grafana/latest/panels-visualizations/visualizations/table/#sparkline

## InfluxDB

Will be startet automaticly with `devenv up`.
However, inside the shell you can use `influxd` to start the server. And `influx` to use the cli.

### Admin UI

URL: `http://localhost:8086/`  
Name: `admin`  
Password: `influxdb`  
Operator Token: `1QNm2IeLFILnRemdGjgAo2e38gwW95rVmaypwRaMTkVrAHKrEqf3NmS7k1D090WQ-MpdgCL5AlBS6Ax4X4uemg==`

### Sample Data

https://docs.influxdata.com/influxdb/v2/reference/sample-data/#bitcoin-sample-data
