from flask import Flask
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from config import Config
from database.db import db
from routes.auth_routes import auth_bp
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
jwt = JWTManager(app)
CORS(app, resources={r"/*": {"origins": [
    os.getenv("http://auth-service-production-b865.up.railway.app"),
    os.getenv("http://booking-service-production-8993.up.railway.app"),
    os.getenv("http://hotel-service-production.up.railway.app"),
    os.getenv("http://admin-app-production-ae7e.up.railway.app"),
    os.getenv("http://user-app-production-ee23.up.railway.app"),
]}}, supports_credentials=True)

# Inisialisasi Prometheus Metrics
metrics = PrometheusMetrics(app)

app.register_blueprint(auth_bp, url_prefix='/api/auth')

if __name__ == '__main__':
    app.run(debug=True, port=8080, host='0.0.0.0')