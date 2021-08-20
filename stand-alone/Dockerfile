FROM ttbb/apollo:admin AS admin
FROM ttbb/apollo:config AS config
FROM ttbb/apollo:portal AS portal

FROM ttbb/base:jdk8

# install mysql first
WORKDIR /opt/sh

RUN wget https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm && \
yum localinstall -y mysql80-community-release-el8-1.noarch.rpm && \
rm -rf mysql80-community-release-el8-1.noarch.rpm && \
yum module disable -y mysql && \
yum install -y mysql-community-server && \
chmod 777 -R /var/log && \
chown -R sh:sh /var/lib/mysql* && \
chown -R sh:sh /run/mysqld && \
mysqld --initialize-insecure --user=root

COPY source /opt/sh

COPY --from=admin /opt/sh/apollo-admin /opt/sh/apollo-admin
COPY --from=config /opt/sh/apollo-config /opt/sh/apollo-config
COPY --from=portal /opt/sh/apollo-portal /opt/sh/apollo-portal

WORKDIR /opt/sh

CMD ["/usr/local/bin/dumb-init", "bash", "-vx", "/opt/sh/scripts/start.sh"]
