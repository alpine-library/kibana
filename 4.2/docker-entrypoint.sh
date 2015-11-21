#!/bin/sh

export ELASTICSEARCH_URL=${ELASTICSEARCH_URL:-"http://localhost:9200"}
echo ELASTICSEARCH_URL=${ELASTICSEARCH_URL}

gosu kibana /opt/kibana/bin/kibana -e ${ELASTICSEARCH_URL}
