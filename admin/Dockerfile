# docker run ttbb/apollo:admin
# docker run -it ttbb/apollo:admin bash
FROM ttbb/base:jdk11

WORKDIR /opt/sh/apollo-admin

COPY source /opt/sh/apollo-admin/hzj

ARG version=1.9.1
ARG download=1.9.1-github

RUN wget https://github.com/ctripcorp/apollo/releases/download/v$version/apollo-adminservice-$download.zip  && \
unzip apollo-adminservice-$download.zip && \
rm -rf apollo-adminservice-$download.zip && \
cp hzj/conf/apollo-admin.properties config/application-github.properties && \
cp hzj/conf/apollo-adminservice.conf apollo-adminservice.conf

CMD ["/usr/local/bin/dumb-init", "bash", "-vx", "/opt/sh/apollo-admin/hzj/scripts/start.sh"]