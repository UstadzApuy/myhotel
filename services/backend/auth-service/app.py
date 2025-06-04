from flask import Flask
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from config import Config
from database.db import db
from routes.auth_routes import auth_bp
import os

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
jwt = JWTManager(app)
<<<<<<< HEAD
CORS(app, resources={r"/*": {"origins": [
    os.getenv("http://auth-service-production-b865.up.railway.app"),
    os.getenv("http://booking-service-production-8993.up.railway.app"),
    os.getenv("http://hotel-service-production.up.railway.app"),
    os.getenv("http://admin-app-production-ae7e.up.railway.app"),
    os.getenv("http://user-app-production-ee23.up.railway.app"),
]}}, supports_credentials=True)
=======
>>>>>>> 573bfe6c437c80ae4e2504c32e222af56f98401d

cors_origins = os.getenv("CORS_ORIGINS", "")
origins_list = [origin.strip() for origin in cors_origins.split(",") if origin.strip()]

CORS(app, resources={r"/*": {"origins": origins_list}}, supports_credentials=True)

with app.app_context():
    db.create_all()

app.register_blueprint(auth_bp, url_prefix='/api/auth')

if __name__ == '__main__':
    app.run(debug=True, port=5001, host='0.0.0.0')
#3