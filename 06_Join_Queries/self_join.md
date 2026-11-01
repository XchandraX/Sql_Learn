# SELF JOIN

## Mengapa Tabel Harus Bergabung dengan Diri Sendiri?
Bayangkan Kita melihat struktur organisasi perusahaan: ada Direktur, Manajer, dan Staf biasa. Semuanya adalah Karyawan, bukan? Jadi, sangat tidak efisien jika kita membuat tabel `tabel_direktur`, `tabel_manajer`, dan `tabel_staf` secara terpisah. Kita harus memasukkan mereka semua ke dalam satu tabel tunggal bernama karyawan.

Tapi, bagiamana caranya kita tahu siapa atasan dari siapa?
Solusinya: Kita buat kolom id_atasan (yang sebenarnya adalah Foreign Key) yang menunjuk kembali ke kolom `id_kayawan` di tabel yang sama!

Logika Kueri: Jurus Kloning Bayangan
Mesin SL tidak bisa membaca satu tabel dua kali dalam satu baris kueri secara langsung. Kiat harus "membodohi" SQL seolah-olah ada dua tabel yang berbeda dengan menggunakan Alias (AS).
- Tabel kloningan 1 kita anggap sebagai Tabel Bawahan.
- Tabel kloningan 2 kita anggap sebagai Tabel Atasan
