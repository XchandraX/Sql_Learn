# CRUD (Create, Read, Update, Delete)

1. INSERT (Create - Memasukkan Data)
Digunakan untuk menyutikkan baris data baru ke dalam tabel.
- Sintaks Tunggal: `INSERT INTO nama_tabel (kolom1, kolom2) VALUES (nilai1, nilai2)`;
- Sintaks Missal (Bulk): `INSERT INTO nama_tabel (kolom1, kolom2) VALUES (nilai1, nilai2), (nilai3, nilai4)`;
- Catatan: Jika nilai berupa teks atau tanggal, wajib diapit tanda kutip satu ('teks'). Angka dan boolean (TRUE / FALSE) tidak perlu kutip.

2. SELECT (Read - Membaca Data)
Digunkanan untuk melihat data. Ini adalah yang palng sering diketik oleh analis data.
- Ambil Semua Kolom: `SELECT * FROM nama_tabel;` (tanda * artinya all)
- Ambil Kolom Tertentu: `SELECT kolom1, kolom2 FROM nama_tabel;`
- Saring dengan WHERE: `SELECT * FROM nama_tabel WHERE kolom_status = 'Aktif';`

3. UPDATE (Update - Mengubah Data)
Digunakan untuk memodifikasi data yang sudah ada.
- Sintaks: `UPDATE nama_tabel SET kolom1 = nilai_baru WHERE kondisi;`
- Aturan Emas: Selalu gunakan WHERE. Jika Kita lupa menulis WHERE, seluruh baris di tabel akan berubah!


4. DELETE (Delete - Menhapus Data)
Digunakan untuk menghapus baris data (bukan menghapus kolom/tabel).
- Sintaks: `DELETE FROM nama_tabel WHERE kondisi;`
- Aturan Emas: Sama seperti UPDATE, selalu gunakan klausa WHERE.
