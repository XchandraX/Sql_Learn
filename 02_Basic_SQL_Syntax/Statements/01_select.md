# SELECT statement
instrumen paling esensial dalam ekosistem analitik data. Berbeda dengan perintah yang mengubah status data secara fisik, SELECT murni merupakan operasi baca (read-only) yang berfungsi memproyeksikan data mentah menjadi informasi yang terstruktur, tanpa sedikit pun memodifikasi tabel aslinya.

## Ilusi Sintaksis vs Urutan Eksekusi Logis
Meskipun kita selalu memulai penulisan kueri dengan kata SELECT, RDBMS mengeksekusinya dalam urutan yang sama sekali berbeda (Logical Query Processing Order). Memahami fase ini adalah kunci mutlak untuk menghindari bug logika dan mengoptimalkan perform:

1. FROM & JOIN: Sistem pertama kali memetakan memori ke tabel sumber dan melakukan penggabungan data (relasi metematis/Kartesian) yang diperlukan

2. WHERE: Baris data disaring satu per satu berdasarkan kondisi logika. (Ini sebabnya klausa ini sangat krusial dalam memangkas beban memori sejak awal)