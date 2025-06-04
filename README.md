# 🏨 MyHotel – Sistem Reservasi Hotel Online

## 📌 Overview

MyHotel adalah aplikasi berbasis web yang dirancang untuk mempermudah proses reservasi kamar hotel secara online. Pengguna dapat melihat halaman utama, mengecek ketersediaan kamar, melakukan booking, serta melihat riwayat pemesanan dengan antarmuka yang intuitif dan responsif.

## 🎯 Fitur Utama

- Halaman Utama: Menampilkan informasi singkat dan ajakan untuk memesan.
- Form Booking: Pengguna dapat memilih tanggal check-in & check-out, serta jumlah tamu untuk mengecek ketersediaan.
- Cek Ketersediaan: Sistem akan menampilkan hasil ketersediaan kamar.
- Riwayat Pemesanan (opsional jika sudah ada): Pengguna dapat melihat daftar pemesanan sebelumnya.

## ⚙️ Teknologi yang Digunakan
- Frontend: React Vite
- Backend: Flask by Python
- Database: PostgreSQL

## 🚀 Deployment to Railway Cloud

This project can be deployed to Railway Cloud using Docker Compose and Railway's managed PostgreSQL service.

### Steps to Deploy

1. Create a Railway project and connect your GitHub repository or upload your code.
2. Add the following environment variables in Railway project settings:
   - `RAILWAY_POSTGRES_USER`
   - `RAILWAY_POSTGRES_PASSWORD`
   - `RAILWAY_POSTGRES_HOST`
   - `RAILWAY_POSTGRES_DB`
   - `JWT_SECRET_KEY` (your JWT secret key)
3. Use the provided `docker-compose.railway.yml` file for deployment, which is configured to use Railway's managed database.
4. Deploy the services using Railway CLI or Railway dashboard.
5. Railway will build and run the services defined in `docker-compose.railway.yml`.

### Initializing the Database

To initialize the PostgreSQL database on Railway, you can import the `db/init.sql` file which contains the schema and initial data:

- Using Railway Dashboard:
  - Go to your Railway project.
  - Open the PostgreSQL plugin.
  - Use the "Run SQL" feature to execute the contents of `db/init.sql`.

- Using psql CLI:
  - Download the `db/init.sql` file locally.
  - Connect to your Railway PostgreSQL database using the connection string.
  - Run the command: `psql <connection_string> -f db/init.sql`

### Notes

- The `db` service is removed in the Railway deployment as Railway provides a managed PostgreSQL instance.
- Backend services connect to the database using Railway environment variables.
- Frontend services expose ports 5173 and 5174; Railway will assign public URLs accordingly.

## 🧪 Tujuan Proyek
Proyek ini dikembangkan sebagai bagian dari tugas besar mata kuliah Cloud Computing agar dapat menerapkan bahan ajar selama kurang lebih setengah semester berjalan.
