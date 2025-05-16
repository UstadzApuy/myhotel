#!/bin/bash
set -e

# Start exporter for admin-app
nginx-prometheus-exporter --nginx.scrape-uri=http://admin-app.railway.internal:80/nginx_status --web.listen-address=:9113 &

# Start exporter for user-app on a different port
nginx-prometheus-exporter --nginx.scrape-uri=http://user-app.railway.internal:80/nginx_status --web.listen-address=:9114 &

# Keep the container running
wait