# website-monitoring
Website monitoring with

* [Prometheus](https://github.com/prometheus/prometheus)
* [Prometheus blackbox exporter](https://github.com/prometheus/blackbox_exporter)
* [Grafana](https://github.com/grafana/grafana)

## Dependencies

* [docker](https://docs.docker.com/install/)
* [docker-composer](https://docs.docker.com/compose/install/)

## Usage

* Edit `config/prometheus/targets.yml` (see targets.yml.example) or use `./gen_target.sh`
* Create and start containers `docker-compose up -d`
* [Visualize dashboard](http://localhost:3000/d/HiWYTqDGp/website-monitoring)

If you already have Prometheus and Prometheus blackbox exporter up and running just import the [dashboard](website-monitoring.json). Update 

## PromQL

Some useful PromQL queries

* Number of days till certificate expiration
  * `(probe_ssl_earliest_cert_expiry{instance=~"$target",job="website-monitoring-http"} - time()) / (60*60*24)`
* Display bad HTTP status code
  * `probe_http_status_code{job="website-monitoring-http",instance="$target"} != 200`

## Resources
