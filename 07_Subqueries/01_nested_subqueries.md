# Nested Subqueries
Pernahkan Kita menemui masalah di mana Kita harus bertanya dulu kepada database sebelum Kita bisa menanyakan pertanyaan utumanya?

Bayangkan skenario ini: "Tolong tampilkan nama film yang durasinya lebih lama dari rata-rata durasi semua film."

Di sinilah letak masalahnya jika pakai SQL biasa:
1. Kita harus mencari tahu dulu berapa rata-rata durasinya (Misal: oh, rata-ratanya 115 menit).
2. Baru Kita menulis kueri kedua: `SELECT judul_film FROM film WHERE durasi > 115`.
Subquery memungkinkan Kita melakukan dua langkah tersebut dalam SATU kueri secara instan. Kueri kecil akan "bersarang" di dalam kueri besar.

``SELECT judul_film, durasi_menit
FROM riwayat_tontonan
WHERE durasi_menit > (
    SELECT AVG(durasi_menit) FROM riwayat_tontonan
);``
