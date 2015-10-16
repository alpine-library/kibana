FROM alpine:3.2
MAINTAINER Ekozan

RUN addgroup kibana && adduser -S -G kibana kibana

RUN apk --update add nodejs curl \
  && rm -rf /var/cache/apk/*

ENV KIBANA_VERSION 4.1.2
ENV KIBANA_SHA1 45e67114f7dac4ccac8118bf98ee8f6362c7a6a1

RUN set -x \
	&& curl -fSL "https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz" -o kibana.tar.gz \
	&& echo "${KIBANA_SHA1}  kibana.tar.gz" | sha1sum -c - \
	&& mkdir -p /kibana \
	&& tar -xz -C /kibana -f kibana.tar.gz \
  && mv /kibana/kibana-${KIBANA_VERSION}-linux-x64/* /kibana/ \
  && rm -rf /kibana/kibana-${KIBANA_VERSION}-linux-x64/ \
	&& rm kibana.tar.gz \
  && ln -sf /usr/bin/node /kibana/node/bin/node \
  && ln -sf /usr/bin/npm /kibana/node/bin/npm


COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 5601
ENTRYPOINT ["/entrypoint.sh"]
