# GROUP BY & HAVING
Bayangkan Kita memiliki setumpuk uang koin campuran di atas meja.
1. GROUP BY adalah proses di mana Kita memisahkan koin-koin tersebut ke dalam tumpukan berdasarkan jenisnya (tumpukan koin 500, tumpukan koin 1000)
2. Fungsi Agregasi (SUM, COUNT, AVG) adalah saat Kita menghitung total nilai atau jumlah koin di masing-masing tumpukan.
3. HAVING adalah saat Kita menyingkirkan tumpukan yang total nilainya kurang dari Rp5.000.

## Klausa `GROUP BY`
`GROUP BY` menyatukan baris-baris yang memiliki nilai yang sama ke dalam satu baris ringkasa. Klausa ini hampir selalu dipasangkan dengan fungsi agregasi (matematika).

Contoh: Menghitung ada berapa banyak produk di masing-masing kategori:
- Sintaks:

``SELECT kategori, COUNT(nama_kopi) AS total_jenis_produk
FROM kategori_produk
GROUP BY kategori;``

- Aturan Emas: Kolom apa pun yang Kita tulis di SELECT (selain yang berada di dalam fungsi agregasi speerti COUNT atau SUM). wajib dimasukan ke dalam klausa GROUP BY.

## Klausa `HAVING` (Filter setelah Agregasi)
- `WHERE` memefilter data sebelum dikelompokkan (membuang baris mentah yg tidak relevan).
- `HAVING` memfilter data setelah dikelompokkan dan dihitung (membuang kelompok yang tidak memenuhi syarat laporan).
- Contoh Menampilkan kategori yang memiliki lebih dari 3 jenis produk. Kita tidak bisa mengunnakan `WHERE COUNT(nama_kopi) > 3` (ini akan error!). Kita harus menggunakan HAVING.

- Sintaks:

``SELECT kategori, COUNT(nama_kopi)
FROM katalog_produk
GROUP BY kategori
HAVING COUNT(nama_kopi) > 3``