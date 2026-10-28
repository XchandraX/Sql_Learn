# Alter Table
memungkinkan skema basis data berevolusi mengikuti kebutuhan bisnis tanpa harus menghancurkan tabel dan data yang sudah ada di dalamnya

Di balik fleksibilitasnya, eksekusi ALTER TABLE pada lingkungan produksi berskala besar memiliki dinamika internal yang berisiko tinggi dan sangat perlu diwaspadai oleh pengembang:

- Penguncian Eksklusif (Exclsive Table Locks):
Pada banyak sistem RDBMS, mengubah struktur fisik table mengharuskan mesin untuk mengunci tabel tersebut secara absolut. Selama operasi ini berlangsung, aplikasi Kita tidak dapat membaca (SELECT) atau menulis (INSERT / UPDATE) ke tabel tersebut. Pada tabel bervolume masif, mengubah tipe data dapat memicu downtime apliasi yang parah.

- Operasi Meta-data vs Penulisan Ulang Fisik(Table Rewrite):
Beberapa perintah, seperti mengganti nama kolom, umunya berjalan instan karena sistem hanya memperbarui kamus data (meta-data). Namun, mengubah tipe data (misalnya dari VARCHAR ke BIGINT) memaksa mesin RDBMS membuat salinan table kosong di latar belakang, Mengonversi dan memindahkan data satu per satu, lalu menukar table lama dengan yang baru. Ini sangat menguras CPU dan ruang disk.

- Jebakan Kolom DEFAULT:
Di sistem lawas, menambahkan kolom baru yang memiliki atribut DEFAULT (misalnya DEFAULT 0) akan memaksa sistem menulis angak 0 ke jutaan baris data secara fisik. RdBMS modern seperti PostgreSQL 11+ dan MySQL 8 telah mengoptimalkan ini: mereka hanya mencatat aturan default di meta-data, sehingga penambahan kolom berjalan dalam hitungan milidetik tanpa memedulikan seberapa besar tabelnya.

- Validasi Konstrain Mundur:
Jika Kita menyuntikkan aturan baru (seperti UNIQUE atau FOREIGN KEY) melalui ALTER TABLE, RDBMS akan langsung memindai seluruh data historis. Jika ditemukan satu saja baris lama yang melanggar aturan ini (misalnya ada nilai duplikat saat Kita menerapkan UNIQUE), maka seluruh perintah modifikasi akan langsung digagalkan dan di-rollback.


Sintaksis ALTER TABLE adalah salah satu area yang paling terfragmentasi antar merek basis data. Sebagai contoh, untuk memodifikasi tipe data kolom, SQL Server dan PostgreSQL menggunakan perintah ALTER COLUMN, MySQL menggunakan MODIFY COLUMN, sementara Oracle atau MariaDB memiliki konvensinya masing-masing.