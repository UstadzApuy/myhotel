# services/backend/all backend services/Dockerfile
FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y postgresql-client && apt-get clean

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn  # Add gunicorn

COPY . .

COPY wait-for-postgres.sh /wait-for-postgres.sh
RUN chmod +x /wait-for-postgres.sh

# Use gunicorn for production
CMD ["/wait-for-postgres.sh", "gunicorn", "--bind", "0.0.0.0:$PORT", "app:app"]