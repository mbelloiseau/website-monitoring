# website-monitoring

Monitore your websites availability with [Prometheus](https://github.com/prometheus/prometheus), [Prometheus blackbox exporter](https://github.com/prometheus/blackbox_exporter), [Grafana](https://github.com/grafana/grafana).

## Dependencies

[docker](https://docs.docker.com/install/) and [docker-composer](https://docs.docker.com/compose/install/)

## Usage

* Edit `config/prometheus/targets.yml` (see targets.yml.example) or use `./gen_target.sh`
* Create and start containers `docker-compose up -d`
* [Visualize dashboards](http://localhost:3000/)

If you already have Prometheus and Prometheus blackbox exporter up and running just import the dashboards ([website-monitoring](website-monitoring.json) or [overview](overview.json)) and use the right [datasource](screenshots/import.png) and [jobs](screenshots/import.png) (http_job and icmp_job)

## Dashboards

* Website monitoring

![web-1](screenshots/website-monitoring_1.png)
![web-2](screenshots/website-monitoring_2.png)

* Overview

![overview](screenshots/overview_1.png)


## PromQL

Some useful PromQL queries

* Number of days till certificate expiration
  * `(probe_ssl_earliest_cert_expiry{instance=~"$target",job="website-monitoring-http"} - time()) / (60*60*24)`
* Display bad HTTP status code
  * `probe_http_status_code{job="website-monitoring-http",instance="$target"} != 200`
* Count the number of each status code
  * `count_values("code", probe_http_status_code)`
