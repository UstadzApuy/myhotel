from flask import Flask
from config import Config
from database.db import db
from routes.room_routes import room_bp
from flask_cors import CORS
import os

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)

cors_origins = os.getenv("CORS_ORIGINS", "")
origins_list = [origin.strip() for origin in cors_origins.split(",") if origin.strip()]

CORS(app, resources={r"/*": {"origins": origins_list}}, supports_credentials=True)

with app.app_context():
    db.create_all()

app.register_blueprint(room_bp)

if __name__ == "__main__":
    app.run(port=5002, debug=True, host='0.0.0.0')
#1