FROM nginx/nginx-prometheus-exporter:latest

EXPOSE 9113

# Copy a script to run multiple instances
COPY start-exporters.sh /start-exporters.sh
RUN chmod +x /start-exporters.sh

CMD ["/start-exporters.sh"]