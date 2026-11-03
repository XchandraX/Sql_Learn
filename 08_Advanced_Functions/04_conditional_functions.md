# Conditional Functions
Ini adalah fitur yang akan membuat Kita seperti programmer sungguhan. Jika ada kita pernah menggunaakn rumus IF di Python, ini adalah versi SQL-nya.

`CASE WHEN` memungkinkan Kita membuat kolom baru yang nilainya ditentukan oleh logika bersyarat (JIKA begini, MAKA begitu).

Sintaks Dasar:
``SELECT nama, nilai,
    CASE
        WHEN nilai >= 90 THEN 'A'
        WHEN nilai >= 8- THEN 'B'
        ELSE 'C'
    END AS predikat_nilai
FROM ujian;``

Aturan penting: Setiap blok CASE harus selalu ditutup dengan kata END.


`COALESCE(kolom, 'Nilai Pengganti')`: 
Fungsi ini adalah pelindung layar (fallback). Jika datanya NULL, ia akan mengubahnya menjadi nilai yang Kita tentukan. Jika tidak NULL, ai tampilkan data aslinya.
- Contoh Kasus: SELECT COALESCE(no_hp, 'Bellum Input Nomor) FROM pelanggan;

`NULLIF(nilai1, nilai2)`:
Fungsi ini mencegah error fatal seperti 'Dibagi oleh Nol". jika nilai1 sama persis dengan nilai2, maka ia akan mengubahnya menjadi NULL.