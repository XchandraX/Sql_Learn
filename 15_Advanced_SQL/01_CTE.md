# Common Table Expressoins (CTE)
Pernahkah Kita menulis Subquery (Kueri di dalam kueri) yang panjangnya bermeter-meter sampai Kita sendiri pusing membacanya?

CTE adalah solusinya. CTE bertindak seperti variabel atau "tabel bayangan sementara" yang Kita definisikan di awal, lalu bisa Kita panggil dengan rapi di kueri utama. CTE membuat kueri SQL menjadi seindah dan serapi bahasa pemrograman Python/JavaScript.

Masalah Klasik (Alasan mengepa CTE diciptakan):
coba perhatika kueri rangking Kita sebelumnya:
``SELECT 
    p.nama,
    RANK() OVER (ORDER BY o.total_harga DESC) AS peringkat
FROM pesanan o INNER JOIN pelanggan p ...
``

Bagaimana jika Boss Kita meminta: "Tampilkan HANYA Juara 1 saja!"
Insting Kita pasti ingin menambahkan: `WHERE RANK() OVER(...) = 1`. Sayangnya, MySQL akan memunculkan ERROR! Window Function tidak boleh ditaruh di dalam klausa `WHERE`.

Solusi CTE (`WITH`):
Kita bungkus kueri ranking tersebut ke dalam CTE, jadikan ia seolah-olah "tabel jadi", barulah kita filter dari luar!
``WITH Nama_Tabel_Bayangan AS (
    -- Masukkan kueri rumit Anda di sini
    SELECT id, nama FROM tabel_asli
)
-- Panggil tabel bayangannya di sini
SELECT * FROM Nama_Tabel_Bayangan;``