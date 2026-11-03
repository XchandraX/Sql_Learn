# Date & Time Functions
    Dalam analisis bisnis, waktu adalah segalanya (Kapan pelanggan beli? Kapan pesanan dikirm? Berapa lama umurnya?). Mesin SQL memiliki "kalendar internal" yang sangat sanggih.

Berikut adalah fungsi-fungsi waktu paling esensial. 
- `CURRENT_DATE()`: Menghasilkan tanggal hari ini (Format: `YYY-MM-DD`).
- `CURRENT_TIMESTAMP()` atau `NOW()`: Menghasilkan tanggal DAN jam detik ini juga
- `YEAR(tanggal)`, `MONTH(tanggal)`, `DAY(tanggal)`: Alat bedah waktu! Fungsinya untuk mengekstrak hanya Tahun, Bulan, atau Tanggal dari sebuah data waktu.
- `DATEDIFF(tanggal_akhir, tanggal_awal)`: Menghitung selisih waktu (dalam satuan hari) antara dua tanggal
- `DATE_ADD(kolom, INTERVAL n YEAR/MONTH/DAY)`: Tambah tanggal sesuai n untuk tahun/bulan/hari.
