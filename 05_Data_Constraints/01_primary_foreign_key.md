# Hubungan PK dan FK
Untuk memcah tabel namun tidak kehilangan jejak datanya, kita menggunakan konsep "Titipan KTP".

1. Primary Key (Kunci Utama): Ini adalah KTP asli (Indentitas unik) dari sebuah baris data. Contoh: `id_kategori` di dalam Kategori.
2. Foreign Key (Kunci Asing): Ini adalah fotokopi KTP yang dititipkan di tabel lain untuk melacak kepemilikian atau hubungan. Contoh: Kita  menitipkan  `id_kategori` di dalam tabel Produk.

Seknario Visual:
Daripada menulis kata 'Kopi' berulang-ulang di tabel Produk, kita buat tabel khusus Kategori:
- Tabel `kategori`: (ID: 1 = 'Kopi', ID: 2 = 'Pastry')
- Tabel `produk`: Produk 'Americano' ckup menyimpan Foreign Key angka 1 di kolom `id_kategori`.

Jika nama kategori berubah, kita cukup mengubah 1 baris di tabel `kategori`. Semua produk yang membawa KTP angka 1 akan otomatis merujuk pada nama yang baru. Inilah yang disebut Integritas Referensial (Referential Integrity).

Pro-Tip `ON DELETE`:
- ON DELETE RESTRICT (atau ditiadakan): RDBMS akan memunculkan error jika Kita mencoba menghapus kategori 'Kopi' padahal masih ada produk MAmericano, ini sangat aman!
- ON DELETE CASCADE: jika kategori 'kopi' dihapus, semua produk dibawahnya akan ikut terhapus otomatis. Gunakan dengan hati-hati.