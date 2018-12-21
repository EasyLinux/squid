#!/bin/sh
set -e

create_log_dir() {
  mkdir -p /var/log/squid
  chmod -R 755 /var/log/squid
  #chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_LOG_DIR}
}

create_cache_dir() {
  mkdir -p /var/cache/squid
  #chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_CACHE_DIR}
}

modify_squid_conf() {
  sed -i "s/%PROXYIP%/$PROXYIP/g" /etc/squid/squid.conf
  sed -i "s/%PROXYPORT%/$PROXYPORT/g" /etc/squid/squid.conf
  if [ "$PROXYUSR" != "" ]; then 
    sed -i "s/#LOGIN//g" /etc/squid/squid.conf
    sed -i "s/%PROXYUSR%/$PROXYUSR/g" /etc/squid/squid.conf
    sed -i "s/%PROXYPWD%/$PROXYPWD/g" /etc/squid/squid.conf
  fi
}


create_log_dir
create_cache_dir

# default behaviour is to launch squid
if [[ -z ${1} ]]; then
  echo "Starting squid..."
  exec $(which squid) -f /etc/squid/squid.conf -NYCd 1 ${EXTRA_ARGS}
else
  exec "$@"
fi

