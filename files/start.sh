#!/bin/sh
mkdir -p /data/logs/supervisor

chown -R nginx: /var/lib/nginx  /nginx/nginx_config/site

/usr/bin/supervisord -n -c /nginx/supervisord.conf
