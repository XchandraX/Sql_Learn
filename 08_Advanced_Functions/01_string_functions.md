# String Functions
Di dunia nyata, data teks yang masuk ke database sering kali berantakan - ada yang memakai huruf kapital semua, huruf keicl semua, atau format yang tidak seragam. Fungsi String adalah alat Kita yang membersihkan dan memformat data tersebut.

Berikut adalah 4 funsi teks paling esensial di SQL:
- `UPPER(teks)` & `LOWER(teks)`: Mengubah teks menjadi HURUF BESAR atau huruf kecil.
- `CONCAT(teks1, teks2, ...)`: Menyambungkan beberapa teks atau kolom menjadi satu kesatuan.
- `SUBSTRING(teks, posisi_awal, jumlah_karakter)`: Mengambil/memotong beberapa huruf dari sebuah teks. (Catatan: Di SQL, karakter pertama dihitung dari angka 1, bukan 0).
- `LENGHT(teks)` atau `LEN(teks)`: Menghitung jumlah huruf/karakter dalam sebuah teks.

"Trio Pembersih Data". Saat Kita bekerja dengan data hasil input manual pengguna (seperti dari Google From), 3 fungsi ini adalah penyelamat hidup Kita:
- `TRIM(teks)`: Menghapus "spasi gaib" yang tidak sengaja terketik di palnig awal atau paling akhir teks. (Spasi di tengah kata tidak akan terhapus)
- `REPLACE(kolom, 'teks_lama', 'teks_baru')`: Mencari kata/karakter tertentu di dalam teks, dan menggantinya dengan kata/karakter lain.
- `LEFT(teks, jumlah)` & `RIGHT(teks, jumlah)`: Jalan pintah dari `SUBSTRING`. Saat ingin mengabmgil paling ujung kiri atau kanan. gunakanan fungsi ini.
