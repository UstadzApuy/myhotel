from flask import Flask
from config import Config
from database.db import db
from routes.booking_routes import booking_bp
from flask_cors import CORS
from flask_jwt_extended import JWTManager
import os

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
jwt = JWTManager(app)
jwt.init_app(app)

cors_origins = os.getenv("CORS_ORIGINS", "")
origins_list = [origin.strip() for origin in cors_origins.split(",") if origin.strip()]

CORS(app, resources={r"/*": {"origins": origins_list}}, supports_credentials=True, expose_headers="Authorization", allow_headers=["Content-Type", "Authorization"])

with app.app_context():
    db.create_all()

app.register_blueprint(booking_bp)

if __name__ == '__main__':
    app.run(port=5003, debug=True, host='0.0.0.0')
#2