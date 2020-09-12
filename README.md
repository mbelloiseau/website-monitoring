# website-monitoring
Website monitoring with Prometheus and Grafana

## Dependencies

* [docker](https://docs.docker.com/install/)
* [docker-composer](https://docs.docker.com/compose/install/)

## Usage

* Edit `config/prometheus/targets.yml` (see targets.yml.example) or use `./gen_target.sh`
* Create and start containers `docker-compose up -d`
* [Visualize dashboard](http://localhost:3000/d/HiWYTqDGp/website-monitoring)

## Resources
