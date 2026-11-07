# Window Functions
Sebuah kueri agregat biasa (`GROUP BY`) akan "menghancurkan" tabel Kita dan hanya menyisakan rangkuman. Window Function melakukan perhitungan di belakang layar, lalu menempelkan hasilnya sebagai kolom baru di samping data asli Kita. Data asli tetap utuh 100%

# Keluarga Window Functions
Di dalam kurung `OVER()`, Kita bisa menggunakan berbagai fungsi selain `RANK()`. Berikut adalah fitur yang sering mucnul di tes wawancara Data Analyst/Engineer.

1. `RANK()` VS `DENSE_RANK()` VS `ROW_NUMBER()`
    Bayangkan ada 2 pesanan yang harganya sama persis di posisi juara 2.
- `RANK()`: Memberikan peringkat: 1, 2, 2, 4 (Juara 3 di-skip/diloncat)
- `DENSE_RANK()`: Meberikan peringkat: 1, 2, 2, 3. (Peringkat rapat, tidak ada angka yang di-skip)
- `ROW_NUMBER()`: Memberikan nomor baris mutlak: 1, 2, 3 ,4 (Tidak peduli nilainya sama, tetap diurutkan paksa berdasrkan urutan sistem).

2. Mesin Waktu SQL: `LAG()` dan `LEAD()`
Ini adalah fitur Window Fucntion yang membuat pemula melongo.
Bagaimana cara Kita menbandingkan pendapatan hari ini dengan pendapatan hari kemarin?
Di SQL biasa, Kita haurs melakukan Self-Join yang rumit.
Tapi dengan Window Function:
- `LAG(total_harga)`: "Tarik nilai `total_harga` dari 1 baris SEBELUMNYA."
- `LEAD(total_harga)`: "Tarik nilai `total_harga` dari 1 baris SETELAHNYA."
