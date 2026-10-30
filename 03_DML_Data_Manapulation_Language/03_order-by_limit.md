# ORDER BY & LIMIT
Klausa ORDER BY sellau diletakkan di palng akhir sebuah kueir (setelah WHERE, GROUP BY, atau HAVING).

ada dua arah penyortiran:
1. ASC (Ascending): Mengurutkan dari kecil ke besar (A ke Z, 1 ke 10, tanggal lama ke baru). ini adlaah pengaturan default. jadi Kita tidak wajib menuliskan kata ASC.
2. DECS (Descending): Mengurutkan dari besar ke kecil (Z ke A, 10 ke 1, tanggal baru ke lama)

Sintaks Dasar:

``SELECT kolom1, kolom2
FROM nama_table
ORDER BY kolom1 DESC;``

Konsep Lanjutan: Penyortiran Berlapis & Limit
- Penyortiran Multikolom: Kita bisa mengurutkan berdasarkan lebih dari satu kolom. Misalnya, urutkan dulu berdasarkan Kategori (A-Z), lalu di dalam kategori tersebut, urutkan harganya dari termahal(DESC). `ORDER BY kategori ASC, harga DESC`
- Pasangan Emas (ORDER BY + LIMIT): Jika Kita hanya ingin mencari "Top 3 Penjualan Tertinggi". Kita mengurutkan datanya dari besar ke kecil (DESC), lalu memotong hasilnya dengan klausa LIMIT 3 (di MySQL/PostgreSQL).