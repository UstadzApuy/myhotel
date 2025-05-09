# services/backend/semua service/config.py
import os

class Config:
    # Use DATABASE_URL if available (Railway), otherwise construct from individual variables
    SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL") or (
        f"postgresql://{os.getenv('DB_USER', 'payylayss')}:"
        f"{os.getenv('DB_PASSWORD', 'payylayss')}@"
        f"{os.getenv('DB_HOST', 'localhost')}/"
        f"{os.getenv('DB_NAME', 'myhotel')}"
    )
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JWT_SECRET_KEY = os.getenv("JWT_SECRET_KEY", "super-secret-key")