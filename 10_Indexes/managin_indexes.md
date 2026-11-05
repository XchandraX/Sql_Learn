# Index
    Bayangkan Kita mencari naam "Siti" di dalam buku telepon setebal 10.000 halaman
- Tanpa Index: Kita harus membaca buku itu selembar demi selembar dari halaman pertama sampai terkahir. Di SQL, ini disebut Full Table Scan (sangat lambat dan membuat server kelelahan).
- Dengan Index: Kita langsung membuka bagian belakang buku (Daftar Indeks), mencari huruf 'S' lalu 'S-i' dan langsung tahu bahwa "Siti ada di halaman 4.502". Kita langsung melompat ke halamn tersebut. Di SQL, ini disebut Index Seek (secepat kilat!).

Saat Data Kita masih 10 atau 100 baris, kueri Kita akan terasa cepat. Tapi di dunia nyata, tabel transaksi e-Commerce bisa memiliki 100 juta baris. Kueri `SELECT ... WHERE ...` tanpa index bisa memakan waktu 5 menit. Dengan Index, kueri yang sama bisa selesai dalam 0,1 detik!

## Sintaks Dasar Index
    Membuat dan menghapus index sangatlah mudah:
-- Membuat Index pada satu kolom
`CREATE INDEX idx_nama_pelanggan ON pelanggan (nama_pelanggan);`

-- Menghapus Index (MySQL)
`DROP INDEX idx_nama_pelanggan ON pelanggan;`

Peringatan Penting:
Jika Index membuat pencarian menjadi secepat kilat, mengapa kita tidak membuat Index untuk SEMUA kolom saja?
Jawabanya: Index memperlambat proses INSERT, UPDATE, dan DELETE.
Setiap kali Kita memasukkan data pelanggan baru, ssitem tidka hanya menyimpan datanya di tabel, tapi juga harus menyusun ulang "buku daftar indeks"nya. Index hany dibuat pada kolom-kolom yang sering dijadikan filter (WHERE) atau digabungakan (JOIN).
