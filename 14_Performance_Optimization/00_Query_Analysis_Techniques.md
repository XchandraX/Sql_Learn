# Performance Optimization (Seni Kueri Kilat)
Kita belajar teknik optimasi dari sisi penuliasn kode (Query analysis Techniques).
Ada dua dosa besar pemula yang paling sering membuat server mati mendadak:

1. Dosa `SELECT *` (Hilangnya Selective Projection)
Pemula suka menarik semua kolom dengan `SELECT *`, padahal yang dibaca di aplikasi haya nama dan harga. Ini membosorkan memori (RAM) server.

- Bad   : `SELECT * FROM jutaan_transaksi;`
- Good  : `SELECT tanggal, total_harga FROM jutaan_transaksi;`

2. Dosa Subquery Berantai (Reducing Subqueries)
Subquery (terutama `IN` atau Correlated Subquery) sering kali memaksa emsin SQL membaca tabel berulang-ulang untuk setiap baris data. Mayoritas Subquery bisa (dan harus) diubah menjadi JOIN agar mesin hanya membacanya satu kali.