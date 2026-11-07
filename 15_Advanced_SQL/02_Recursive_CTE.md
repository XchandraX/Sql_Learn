# Recursive CTE (Kueri Rekursif)
Secara sederhana, Recursive CTE adalah CTE adalah tabel bayangan yang memanggilkan dirinya sendiri berulang-ulang sampai sebuah kondisi terpenuhi (seperti perulangan / looping `WHILE` dalam programming)

Kapan Kita menggunakannya?
1. Membuat urutan angka atau tanggal kalender secara otomatis (tanpa perlu tabel fisik).
2. Memetakan data hierarki/silsilah (Contoh: menampilkan struktur organisasi dari Direktur -> Manajer -> Staf)

Sintaks Dasar ("Hello World" Rekursif)
``WITH RECURSIVE nama_cte AS (
    SELECT 1 AS angka

    UNION ALL

    SELECT angka + 1
    FROM nama_cte
    WHERE angka < 5
)
SELECT * FROM nama_cte;``

Jika kueri di atas dijalankan, mesin SQL akan mencetak angka 1. Lalu ia akan masuk ke bawah, menambahkan 1+1 = 2. Lalu memanggi dirinya lagi, 2+1= 3... terus berputar sampai menyentuh angka 5, dan akhinrya mencetak tabel berisi angka 1 sampai 5.