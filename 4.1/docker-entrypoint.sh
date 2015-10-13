#!/bin/sh

export ELASTICSEARCH_URL=${ELASTICSEARCH_URL:-"http://localhost:9200"}
echo ELASTICSEARCH_URL=${ELASTICSEARCH_URL}

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
	set -- kibana -e ${ELASTICSEARCH_URL} "$@"
fi

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
	set -- gosu kibana -e ${ELASTICSEARCH_URL} "$@"
fi

exec "$@"
