FROM ttbb/apollo:admin AS admin
FROM ttbb/apollo:config AS config
FROM ttbb/apollo:portal AS portal

FROM ttbb/base:jdk11

# install mysql first
WORKDIR /opt/sh

RUN wget https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm && \
dnf localinstall -qy mysql80-community-release-el8-1.noarch.rpm && \
rm -rf mysql80-community-release-el8-1.noarch.rpm && \
dnf module disable -y mysql && \
dnf install -qy --nogpgcheck mysql-community-server && \
mysqld --initialize-insecure --user=root

COPY source /opt/sh

COPY --from=admin /opt/sh/apollo-admin /opt/sh/apollo-admin
COPY --from=config /opt/sh/apollo-config /opt/sh/apollo-config
COPY --from=portal /opt/sh/apollo-portal /opt/sh/apollo-portal

WORKDIR /opt/sh

CMD ["/usr/local/bin/dumb-init", "bash", "-vx", "/opt/sh/scripts/start.sh"]
