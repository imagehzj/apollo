# docker run ttbb/apollo:portal
# docker run -it ttbb/apollo:portal bash
FROM ttbb/base:jdk11

WORKDIR /opt/sh/apollo-portal

COPY source /opt/sh/apollo-portal/hzj

ARG version=1.9.1
ARG download=1.9.1-github

RUN wget https://github.com/ctripcorp/apollo/releases/download/v$version/apollo-portal-$download.zip  && \
unzip apollo-portal-$download.zip && \
rm -rf apollo-portal-$download.zip && \
cp hzj/conf/apollo-portal.properties config/application-github.properties && \
cp hzj/conf/apollo-portal.conf apollo-portal.conf

CMD ["/usr/local/bin/dumb-init", "bash", "-vx", "/opt/sh/apollo-portal/hzj/scripts/start.sh"]
