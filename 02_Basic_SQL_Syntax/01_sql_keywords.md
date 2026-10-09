# SQL Keywords
kosakata dan tata bahasa fundamental yang mendikte bagaimana mesin basis data (RDBMS) mem-parsing, merencanakan, dan mengeksekusi setiap operasi.


## Data Manipulation Language (DML)
    Kata kunci dalam kategori ini digunakan untuk memanipulasi, menyisipkan, dan mengekstrak isi data aktual di dalam tabel, tanpa mengubah struktur penyimpanannya.

- `SELECT`      : Perintah paling fundamental dan sering digunakan untuk mengambil data. Dapat dirangkai dengan fungsi agregasi matematis dan operator logika yang kompleks.

- `INSERT INTO` : Menginstruksikan sistem untuk menyuntikkan baris data baru (record) ke dalam tabel spesifik.

- `UPDATE`      : Memodifikasi data yang sudah ada di dalam tabel. Penggunaan peritnah ini hampior selalu memerlukan pendampingan klausa logika untuk mencegah pembaruan tak disengaja pada seluruh basis data

- `DELETE`      : Menghapus baris data tertentu secara permanen. juga bergantung pada kondisi spesifik agar tidak menghapus seluruh rekam jejak tabel


## Data Definition Language (DDL)
    Alih-alih menuyentuh data, kata kunci DDL bekerja pada tingkat skema (meta-data). Mereka bertanggung jawab untuk mendefinisikan, mengubah, atau menghancurkan kerangka struktural penyimpan data itu sendiri.

- `CREATE`  : Menginisialisasi objek baru dari nol, seperti membangun basis data baru, tabel, indeks untuk pencarian cepat, atau views.

- `ALTER`   : Mengonfigurasi ulang struktur objek yang sudah ada (misalnya, menyisipkan kolom baru dengan klausa `ADD` atau menghancurkan kolom dengan `DROP COLUMN`).

- `DROP`    : Menghancurkan seluruh entitas objek secara permanen beserta data, indeks, dan hak akses yang melekat padanya.

- `TRUNCATE`: Mengosongkan seluruh baris dalam sebuah tabel secara instan melalui metode pelepasan halaman penyimpanan (storage page deallocation), membuatnya jauh lebih cepat dibandingkan `DELETE`, tetapi tetap mempertahankan kerangka tabelnya.


## Klausa Penyaringan dan Pengelompokan Data
    Kumpulan kata kunci ini bertindak sebagai filter analitik dan pengatur alur logika untuk menyaring data mentah menjadi informasi yang bernilai.

- `WHERE`   : Menyaring record sebelum tahapan penglompokan data, bertindak sebagai gerbang filtrasi pertama untuk membatasi volume hasil pencarian.

- `GROUP BY`: Mengonsolidasikan baris-baris yang memiliki kesamaan nilai dimensi ke dalam satu baris ringkasan. Biasanya digabungkan dengan fungsi agregat seperti `COUTN()`, `MAX()`, `MIN()`, `SUM()`, atau `AVG`.

- `HAVING`  : Berfungsi identik dengan `WHERE`, namun posisinya dalam siklus eksekusi berada setelah agregasi selesai. Ini merupakan satu-satunya kata kunci yang diizinkan untuk memfilter hasil dari sebuah fungsi agregat (misalnya, menampilkan wilayah yang memiliki total penjualan lebih dari $10.000).

- `ORDER BY`: Menentukan metode penyajian hasil akhir berdasarkan abjad atau urutan numerik, baik secara Ascending (`ASC`) maupun Descending (`DECS`)


## Operasi Relasional (JOIN Clauses)
Kata kunci `JOIN` merepresentasikan tulang punggung dar imodel relasional, memfasilitasi penggabungan matematis antara dua tabel atau lebih berdasarkan kunci(keys) yang saling tumpang tindih.
- Variasi seperti `INNER JOIN`, `LEFT JOIN`,`RIGHT JOIN`, dan `FULL OUTER JOIN` memberikan kendali menentukan irisan data mana (termasuk null values) yang harus diekstraksi dari entitas-entitas yang saling berelasi.

## Transaction & Data Control (TCL & DCL)
Untuk menamin prinsip ACID (Atomicity, Consistency, Isolation, Durability) dan arsitektur keamanan di tingkat enterprise, SQL menggunakan kata kunci kontrol khusus:
- `COMMIT` dan `ROLLBACK` (TCL) : Mengonfirmasi pelestarian perubahan transaksi multidata secara permanen ke dalam disk, atau secara refleks membatalkan seluruh rangkaian

- `GRANT` dan `REVOKE` (DCL)    : Mengelola hierarki otorisasi, memberikan hak istimewa, atau mencabut akses akun pengguna terhadap prosedur sistem dan data sensifit.

Aturan Identifier Khusus: Karena kata-kata tersebut di atas direservasi khusus untuk instruksi kompilasi oelh mesin SQL, pengguna dilarang menggunakannya sebagai nama kolom, nama tabel, atau alias secara langsung. Jika sebua kolom benar-benar harus diberi nama "Select atau "Update", kata kunci tersebut harus dikarantina menggunakan sintaksis escape khusu (backticls `SELECT` di MySQL, atau tanda kurung siku [`SELECT`] di SQL Server).