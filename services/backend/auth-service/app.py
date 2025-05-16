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
    "http://localhost:5173",
    "http://localhost:5174",
    "http://admin-app-production-ae7e.up.railway.app",
    "http://user-app-production-ee23.up.railway.app",
    "http://prometheus-service-production.up.railway.app"
]}}, supports_credentials=True)

# Inisialisasi Prometheus Metrics
metrics = PrometheusMetrics(app)

with app.app_context():
    db.create_all()

app.register_blueprint(auth_bp, url_prefix='/api/auth')

if __name__ == '__main__':
    app.run(debug=True, port=8080, host='0.0.0.0')