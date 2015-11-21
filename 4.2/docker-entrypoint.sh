#!/bin/sh

export ELASTICSEARCH_URL=${ELASTICSEARCH_URL:-"http://localhost:9200"}
echo ELASTICSEARCH_URL=${ELASTICSEARCH_URL}

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
	set -- gosu kibana /opt/kibana/bin/kibana -e ${ELASTICSEARCH_URL}
fi

exec "$@"
