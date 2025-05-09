# services/backend/booking-service/app.py
from flask import Flask
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from config import Config
from database.db import db
from routes.booking_routes import booking_bp  # Use booking-specific routes

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
jwt = JWTManager(app)
CORS(app, resources={r"/*": {"origins": [
    "http://localhost:5173",
    "http://localhost:5174",
    "https://myhotel-zeta.vercel.app/"  # Add Vercel domain
]}}, supports_credentials=True)

with app.app_context():
    db.create_all()

app.register_blueprint(booking_bp, url_prefix='/api/booking')

if __name__ == '__main__':
    app.run(debug=True, port=5003, host='0.0.0.0')  # Unique port