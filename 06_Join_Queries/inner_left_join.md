# INNER JOIN
Bayangkan Diagram Veen (dua lingkaran yang saling bertindih di tengah).
- Lingkarang Kiri adalah Table A.
- Lingkarang Kanan adlaah Table B.
- Bagian Tengah (Irisan) adalah INNER JOIN.

Aturan Emas INNER JOIN: "Hanya tampilkan baris yang memiliki pasangan (cocok) di KEDUA tabel."
Jika ada data di Tabel A yang tidak punya pasangan di Tabel B (atau sebaliknya), maka data tersebut akan dibuang dari hasil laporan

Tabel 1: pelanggan (Tabek Induk)
|id_pelanggan|nama_pelanggan|
|---|---|
|1|Budi|
|2|Siti|
|3|Andi (Belum pernah beli)|

---

Tabel 2: pesanan (Tabel Anak)
|id_pesanan|barang|id_pelanggan|
|---|---|---|
|101|Kopi Hitam|1 (Milik Budi)|
|102|Croissant|1 (Milik Budi)|
|103|Teh Manis|2 (Milik Siti)|
|104|Kue Sus|99 (Error/Tidak terdaftar)|

Tujuan: kita ingin membuat laporan yang menampilkan Nama Pelanggan beserta Barang yang dibelinya

``Kueri INNER JOIN:
SELECT
    u.nama_pelanggan,
    p.barang
FROM pelanggan
INNER JOIN pesanan p ON u.id_pelanggan = p.id_pelanggan;``

Pro-Tip Sintaksis:
klausa ON adalah kuncinya. Di sinilah Kita memberi tahu sistem: "Tolong cocokkan Primary Key dari tabel pelanggan dengan Foreign Key dari tabel pesanan!"

Hasil Laporan (Output):
|nama_pelanggan|barang|
|---|---|
|Budi|Kopi Hitam|
|Budi|Croissant|
|Siti|Teh Manis|


# LEFT JOIN
`LEFT JOIN` akan menyelmatkan dan menampilkan seluruh data dari tabel sebelah kiri, terlepas dari apakah ia punya pasangan di tabel kanan atau tidak.

Aturan Emas LEFT JOIN:
"Tampilkan semua baris dari Tabel A (Kiri). Jika ada pasangannya di TAbel B (Kanan), tampilkan. Jika tidak ada pasangannya. Biarkan kosong (NULL)."

Kueri LEFT JOIN:
SELECT 
    u.nama_pelanggan,
    p.barang
FROM pelanggan
LEFT JOIN pesanan p ON u.id_pelanggan = p.id_pelanggan;

Hasil Laporan (Output):
|nama_pelanggan|barang|
|---|---|
|Budi|Kopi Hitam|
|Budi|Croissant|
|Siti|Teh Manis|
|Andi|NULL|

Kapan Kita memnggunakan LEFT JOIN di Dunai Nyata?
`LEFT JOIN` adalah kueri wajib untuk mencari "Siapa yang belum melakukan sesuatu?".
- Mencari pelanggan yang mendaftar tapi belum pernah belanja (seperti Andi).
- Mencari film di database yan gbelum pernah ditonton oleh siapa pun.
- Mencari karyawan yang belum absen hari ini