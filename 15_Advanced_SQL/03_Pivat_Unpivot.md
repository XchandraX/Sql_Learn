# Pivot & Unpivot (Seni Melipat Data)
Sebagai Data analyst atau Engineer, kita akan sering diminta membuat laporan dari atasan. Biasanya database menyimpan data secara vertikal (baris), tetapi atasan ingin membacanya secara horizontal (kolom) layaknya tabel Excel.

Skenario:
Tabel asli di database (Bentuk Baris / Unpivot)
|Bulan|Kategori|Pendapatan|
|---|---|---|
|Jan|Kopi|50000|
|Jan|Teh|30000|
|Feb|Kopi|60000|

Bos ingin laporan bentuk (Pivot):
|Bulan|Pendapatan_Kopi|Pendapatan_Teh|
|---|---|---|
|Jan|50000|30000|
|Feb|60000|0|

(Catatan Penting: Berbeda dengna SQL Server, MySQL tidak memiliki fungsi bawaan `PIVOT`. Oleh karena itu, Data Engineer MySQL menggunakan teknik gabungan `SUM()` dan `CASE WHEN` untuk melakukan Pivot manual!!)

