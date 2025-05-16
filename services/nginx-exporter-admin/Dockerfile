FROM nginx/nginx-prometheus-exporter:latest
EXPOSE 9113
CMD ["nginx-prometheus-exporter", "--nginx.scrape-uri", "http://admin-app.railway.internal:80/nginx_status"]