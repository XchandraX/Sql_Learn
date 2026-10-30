# The Big 5 Aggregate Functions
Fungsi agregat dapat digunakan secara mandiri (mengukur seluruh isi tabel) atau dipasangkan dengan GROUP BY (mengukur per kelompok).

1. COUNT() - Menghitung Jumlah Baris
    - COUNT(*): Menghitung semua baris di tabel, tidak peduli isinya kosong (NULL) atau tidak
    - COUNT(nama_kolom): Menghitung baris yang ada isinya sajaj (mengabaikan NULL).
    - COUNT(DISTINCT nama_kolom): Hanya menghitung nilai yang unik (tidak menghitung data duplikat)

2. SUM() - Menjumlahkan Nilai
    - Hanya bisa digunkan untuk tipe data numerik (angka).

3. AVG() - Nilai Rata-rata (Average)
    - Hanya untuk tipe data numerik.
    - Jebakan Batman: AVG secara otomatis mengabaikan baris yang bernilai NULL. Jika dari 10 pengguna, 2 orang memiliki kolom rating bernilai NULL, maka AVG hanya akan membagi total nilai dengan angka 8, bukan 10.

4. MAX() - Nilai Tertinggi/Terbesar
    - Bisa untuk angka(mencari harga termahal), teks(mencari urutan abjad terakhir huruf Z), atau tanggal (mencari tanggal transaksi paling baru/terakhir).

5. MIN() - Nilai Terendah/Terkecil
    - Kebalikan dari MAX(). Bisa mencari harga termurah, abjad berawalan A, atau tanggal transaksi paling lama).