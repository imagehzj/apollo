
FROM ttbb/base:jdk11

WORKDIR /opt/sh/apollo-config

COPY source /opt/sh/apollo-config/hzj

ARG version=1.9.1
ARG download=1.9.1-github

RUN wget https://github.com/ctripcorp/apollo/releases/download/v$version/apollo-configservice-1.9.1-github.zip  && \
unzip apollo-configservice-$download.zip && \
rm -rf apollo-configservice-$download.zip && \
cp hzj/conf/apollo-config.properties config/application-github.properties && \
cp hzj/conf/apollo-configservice.conf apollo-configservice.conf

CMD ["/usr/local/bin/dumb-init", "bash", "-vx", "/opt/sh/apollo-config/hzj/scripts/start.sh"]
