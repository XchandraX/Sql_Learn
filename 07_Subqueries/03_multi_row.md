# Multi-Row Subquery

Masalah terjadi ketika kueri di dalam tanda kurung `( )` menghasilkan lebih dari satu baris. Bayangkan Kita menulis kueri ini:
``SELECT nama_menu FROM menu_kopi
WHERE harga = (SELECT harga FROM menu_kopi WHERE kategori = 'Kopi')``

Jika kategori 'Kopi' memiliki 3 jenis minuman dengan harga berbeda (misal: 15.000, 20.000, 25.000), mesim SQL akan langsung berteriak Error: Subquery returns more than 1 row. Mesim kebingungan karena operator `=` hanya sanggup meghadapi satu lawan satu.

Solusinya? Kita ganti tanda `=` dengan operator `IN` (Yang berarti "apakah ada di dalam daftar ini?")
Jika Kita ingin mencari kebalikannya (data yang TIDAK ADA di dalm daftar). Kita cukup menggunakan `NOT IN`.

