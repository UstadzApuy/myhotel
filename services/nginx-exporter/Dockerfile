FROM nginx/nginx-prometheus-exporter:latest
EXPOSE 9113
CMD ["nginx-prometheus-exporter", "-nginx.scrape-uri", "http://admin-app-production-ae7e.up.railway.app:80/nginx_status", "-nginx.scrape-uri", "http://user-app-production-ee23.up.railway.app:80/nginx_status"]