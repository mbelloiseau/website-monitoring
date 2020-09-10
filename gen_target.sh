#!/bin/bash

config_file="config/prometheus/targets.yml"

if [ $# -lt 1 ] ; then
  echo "Usage: $0 website-1.tld website-2.tld ..."
  exit 1
fi

if [ -f ${config_file} ] ; then
  mv -v ${config_file} ${config_file}-$(date '+%s')
fi

echo "- targets:" > ${config_file}

for x in $@ ; do
  echo "  - ${x}" >> ${config_file}
done
