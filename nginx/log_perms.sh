#!/bin/sh

chown -R nginx:nginx /var/log/nginx

exec runuser -u root -- "$@"
