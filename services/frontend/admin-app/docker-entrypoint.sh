#!/bin/sh
# Substitute environment variables in nginx.conf and start nginx

envsubst '\$AUTH_SERVICE_URL \$BOOKING_SERVICE_URL \$HOTEL_SERVICE_URL' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
