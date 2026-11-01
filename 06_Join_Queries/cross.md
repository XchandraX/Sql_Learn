# CROSS JOIN
Perbedaan paling mendasar antara CROSS JOIN dengan semua join adalah: CROSS JOIN sama sekali tidak menggunakan klausa ON, ai tidak peduli apakaah data itu berelasi atau punya Foreign Key.

Aturan Emas CROSS JOIN:
"Kalikan SETIAP baris di Tabel Kiri dengan SETIAP baris Kanan."

Dalam matematika, ini disebut Produk Kartesius (Cartesian Product). Jika Tabel A punya 3 baris dan Tabel B punya 4 baris, hasil laporannya pasti berisi 12 baris (3 x 4).

## Menu Baru Kopi Senja
Bayangkan Kedai "Kopi Senja" ingin meluncurkan sistem menu baru. Mereka memiliki 2 tabel master yang terpisah.

Tabel `rasa` (3 Baris):
1. Kopi Susu
2. Matcha
3. Taro

Tabel `rasa` (2 baris):
1. Regular
2. Large

Jika bos Kita meminta: "Tolong buatkan daftar kombinasi seluruh menu yang mungkin kita jual!" Kita cukup menggunakan CROSS JOIN.
``SELECT 
    r.nama_rasa,
    u.nama_ukuran
FROM rasa r
CROSS JOIN ukuran u;``

Hasil Laporan (3 x 2 = 6 baris)
|nama_rasa|nama_ukuran|
|---|---|
|Kopi Susu|Regular|
|Kopi Susu|Large|
|Matcha|Regular|
|Matcha|Large|
|Taro|Regular|
|Taro|Large| 

Kapan ini Dipakai di Dunia Nyata?
Karena sifatnya yang melipatgandakan data, Data Engineer sangata berhati-hati dengan kueri ini. Jika tabel A punya 1.000 baris dan B punya 1.000 baris, kueri ini akan mencetak 1 juta baris data dan bisa membuat server hang!

Biasanya ini dipakai untuk:
1. Membuat Data Master/Matriks: Seperti ukuran baju (S, M, L) dikalikan dengan warna (Merah, Biru, Hitam).
2. Penjadwalan Olahraga: Memasangkan setiap tim dengan time lain untuk membuat jadwal pertandingan (sistem round-robin).
3. Membuat Data Dummy Masif: Menggabungkan tabel nama depan dan tabel nama belakang untuk mencetak ribuan nama user palsu saat menguji beban aplikasi.

