# SELECT statement
instrumen paling esensial dalam ekosistem analitik data. Berbeda dengan perintah yang mengubah status data secara fisik, SELECT murni merupakan operasi baca (read-only) yang berfungsi memproyeksikan data mentah menjadi informasi yang terstruktur, tanpa sedikit pun memodifikasi tabel aslinya.

## Ilusi Sintaksis vs Urutan Eksekusi Logis
Meskipun kita selalu memulai penulisan kueri dengan kata SELECT, RDBMS mengeksekusinya dalam urutan yang sama sekali berbeda (Logical Query Processing Order). Memahami fase ini adalah kunci mutlak untuk menghindari bug logika dan mengoptimalkan perform:

1. FROM & JOIN: Sistem pertama kali memetakan memori ke tabel sumber dan melakukan penggabungan data (relasi metematis/Kartesian) yang diperlukan

2. WHERE: Baris data disaring satu per satu berdasarkan kondisi logika. (Ini sebabnya klausa ini sangat krusial dalam memangkas beban memori sejak awal).

3. GROUP BY: Sisa baris yang lolos filter WHERE dikompokkan ke dalam "keranjang" berdasarkan nilai dimesnsi (misalnya, dikelompkkan per depertemen).

4. HAVING: Filter ini menyaring "keranjang" gerup tersebut (misalnya, hanya ambil departemen dengan totol karyawan > 10).

5. SELECT: Barulah mesin mengevaluasi kolom spesifik yang ingin ditampilkan, menjalankan perhitungan matematika tingkat baris, dan menerapkan alias kolom (AS).

6. DISTINCT: Mesin memindai hasil dari bloik SELECT untuk membuang baris yang persis sama.

7. ORDER BY: Hasil akhir diurutkan secaramemori (proses yang mahal jika datanya besar).

8. LIMIT / OFFSET: Mesin menghentikan pemuatan data ke antarmjka aplikasi setela hmencapai batas baris yang diminta.

Dampak Praktis Eksekusi: Karena klausa SELECT dieksekusi hampir di bagian paling akhir,  Kita tidak bisa menggunakan alias kolom yang dibuat di SELECT ke dalam klausa WHERE. Saat WHERE sedang dievaluasi, sistem belum mengetahui keberadaan alias tersebut.

## Evolusi Analitik Lanjutan
- Common Table Expressions (CTE)
- Window Funtions (OVER())