FROM alpine:3.2
MAINTAINER Ekozan

RUN addgroup kibana && adduser -S -G kibana kibana

RUN apk --update add nodejs curl \
  && rm -rf /var/cache/apk/*

ENV KIBANA_VERSION 4.2.0
ENV KIBANA_SHA1 ac2247783b88058778e010562a91ee721d49ace3

RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.6/gosu-amd64"

RUN set -x \
	&& curl -fSL "https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz" -o kibana.tar.gz \
	# && echo "${KIBANA_SHA1}  kibana.tar.gz" | sha1sum -c - \
	&& mkdir -p /opt/kibana \
	&& tar -xz -C /opt/kibana -f kibana.tar.gz \
  && mv /opt/kibana/kibana-${KIBANA_VERSION}-linux-x64/* /opt/kibana/ \
  && rm -rf /opt/kibana/kibana-${KIBANA_VERSION}-linux-x64/ \
	&& rm kibana.tar.gz \
  && ln -sf /usr/bin/node /opt/kibana/node/bin/node \
  && ln -sf /usr/bin/npm /opt/kibana/node/bin/npm \
  && chown -R kibana:kibana /opt/kibana


COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 5601
ENTRYPOINT ["/entrypoint.sh"]
