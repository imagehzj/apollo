mysqld --daemonize --user=root

mysql -u root < /opt/sh/scripts/apollo-config.sql
mysql -u root < /opt/sh/scripts/apollo-portal.sql
mysql -u root < /opt/sh/scripts/grant.sql

cp /opt/sh/conf/apollo-env.properties /opt/sh/apollo-portal/config/apollo-env.properties

bash -x /opt/sh/apollo-config/hzj/scripts/start-daemon.sh
bash -x /opt/sh/apollo-admin/hzj/scripts/start-daemon.sh
bash -x /opt/sh/apollo-portal/hzj/scripts/start-daemon.sh

tail -f /dev/null