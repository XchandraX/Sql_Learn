# Derived Tables (Tabel Turunan) atau Inline Views
Jika Scalar Subquery di `WHERE` bertindak berbagai "kalkulator", maka Subquery di `FROM` bertindak sebagai "Tabel Virtual / Tabel Bayangan"

Biasanya, klausa `FROM` selalu diikuti oleh nama tabel fisik yang benar-benar ada di database (seperti FROM pelanggan). Namun, ada kalanya kita perlu mengolah data daritabel fisik tersebut, dan hasil olahannya ingin kita olah lagi.

Kasus Paling Umum (Agregasi dari Agregasi):
Kita tiak bis melakukan fungsi agregat di dalam fungsi agregat. Misalnya, Kita dilarang keras menulis kode seperti ini: `SELECT AVG(SUM(total_belanja)) FROM pesanan` (SQL akan error!)

Untuk mencari "Berapa rata-rata dari total belanja masing-masing pelanggan?", Kita harus melakukan 2 tahap:
1. Rekap dulu total belanja per pelanggan (menjadi Tabel Virtual)
2. Hitung rata-rata dari Tabel Virtual tersebut.

Aturan Emas Derived Table:
Setiap kueri yang bersarang di dalam klausa `FROM` WAJIB diberi nama (Alias/AS). Jika tidak diberi nama, mesin SQL akan bingung bagaimana cara memanggil tabel bayangan tersebut.

