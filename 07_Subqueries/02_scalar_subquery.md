# Scalar Subquery
Kata Scalar dalam istilah database merujuk pada satu nilai tunggal (satu baris dan satu kolom).

Jenis kueri bersarang yang paling sering dipakai karena ia bertindak layaknya sebuah "kalkulator rahasia". Sistem akan menjalankan kueri yang ada di dalam tanda kurung terlebih dahulu untuk menhasilkan satu angka pasti, lalu melemparkan angka tersebut ke kueri utama untuk dijadikan patokan perbandingan (=, >, <, <=,>=).

Aturan Emas Scalar Subquery:
Kueri yang berada di dalam tanda kurung () TIDAK BOLEH menhasilkan lebih dari satu baris atau lebih dari satu kolom. Jika kueri di dalam kurung menhasilkan dua angka, mesim SQL akan error karena ia bingung angka mana yang harus dibandingkan.

