# RIGHT JOIN
ini adalah kebalikan persis dari LEFT JOIN.
- Visualisasi: Kita mengarsir seluruh lingkaran kanan beserta irisanya.
- Aturan: Tampilkan semua baris dari Tabel B (kanan). Jika ada pasangannya di Tabel A (Kiri), tampilkan. Jika tidak ada, isi Tabel Kiri dengan NULL.

# FULL OUTER JOIN
ini adalah gabugan antara kiri dan kanan.
- Visualisasi: Kita mengarsir kedua lingkaran sepenuhnya (semua sisi).
- Aturan: Tampilkan SEMUA data dari kedua tabel! Jika ada pasangan, gabungkan. Jika tabel Kiri tidak punya pasangan di Kana, Jadikan Kanan NULL> Jika tabel Kanan tidak punya pasangan di Kiri, jadikan Kiri NULL.
- Kapan Dipakai? Sangat saat melakukan Audit Rekonsiliasi (misalnya mencocokan laporan bank A dan laporan bank B untuk melihat transaksi mana yang hilang di salah satu sisi).

Jebakan Sistem (MySQL / MariaDB):
MySQL dan MariaDB TIDAK memiliki perintah FULL OUTER JOIN secara bawaan seperti PostgreSQL atau SQL Server. Untuk melakukannya di MySQL, kita melakukan trik gabungan: LEFT JOIN digabung dengan RIGHT JOIN menggunakan perintah UNION.