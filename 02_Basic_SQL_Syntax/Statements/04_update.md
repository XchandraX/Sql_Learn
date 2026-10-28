# Perintah UPDATE
Salah satu operas iapling berisiko sekaligus paling krusial dalam siklus hidup aplikasi. Jika INSERT membangun fondasi dan SELECT bertindak sebagai lensa pengamat, UPDATE adalah proses mutasi yang mengubah fakta di dalam sistem secara real-time.

Eksekusi UPDATE di tingkah server jauh lebih kompleks daripada sekadar menimpa teks. RBDMS harus menemukan letak fisik baris tersebut di disk, mengunci baris agar tidak diubah oelh pengguna lain pada milidetik yang sama (row-level locking), memverifikasi bahwa nilai baru mematuhi aturan tabel (constraints), dna mencatat perubahan tersebut ke dalam log transaksi sebelum menyimpannya secara permanen. 

1. Bencana "WEHRE" yang Terlupakan
sama halnya dengan DELETE, mengeksekusi UPDATE tanpa klausa WHERE akan secara instan mengubah seluruh baris di dalam tabel dengan nilai yang baru. Praktik emas di industri perangkat lunak saat memodifikasi data di lingkungan production adlaah selalu membungkus perintah dalam blok transaksi:

Jalankan BEGIN TRANSACTION terlebih dahulu, eksekusi pembaruan, periksa log jumlah baris yang terdampak (row affected), lalu panggil COMMIT jika jumlahnya sesuai, atau ROLLBACK untuk membatalkan semuanya secara refleks jika jumlahnya melebihi ekspektasi (misalnya: Kita berniat mengubah 1 baris, namun sistem melaporkan 5.000 baris terdampak).

2. Mutasi Lintas Tabel (UPDATE dengan JOIN)
Sering kali sistem perlu memperbarui data berdasarkan informasi yang hidup di tabel lain -- misalnya, menaikkan harga semua produk yang disuplai oleh "Vendor A". Sebagain besar RDBMS (seperti PostgreSQL, MySQL, dan SQL Server) mengizinkan penggunaan klausa JOIN (atau klausa FROM tambahan) langsung di dalam perintah UPDATE. Mengeksekusi logika silang-tabel ini di level server jauh lebih cepat daripada menarik data ke memori aplikasi dan memprosesnya menggunakan proses perulangan (looping).

3. Operasi Atomik dalam Persamaan Matematis
Kalusa SET dapat mereferensikan nilai lamanya sendiri untuk melakukan kalkulasi matematis dalam satu langkah atomik. Menggunakn perintah seperti SET Saldo = Saldo - 100 jauh lebih aman dari bug konkurensi (seperti race conditions) dibandingkan jika aplikasi membaca nilai saldo terlebih dahulu, menguranginya di kode program, lalu mengirimkan perintah UPDATE dengan nilai mutlak. Mesin basis data akan mengunci baris tersebut secara ketat sampai kalkulasi matematis internalnya selesai.

4. Beban Ekstra pada Indeks (Index Overhead)
Memodifikasi data pada kolom yang terindeks (terutama kolom pencarian utama) membawa beban kinerja ganda. RDBMS tidak hanya harus mengubah data di halaman penyimpannaya. tetapi juga diwajibkan untuk merekonstruksi struktur pohon indeks (B-Tree) agar keseimbangannya terjaga dan pencarian di masa depan tetap akurat. Inilah alasan mengapa kolom yang sangat sering diperbarui (seperti kolom last_login_timestamp) sering kali dipisahkan atau tidak diindeks jika tidak mutlak diperlukan.