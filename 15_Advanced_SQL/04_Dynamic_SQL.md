# Synamic SQL (Sihir Kueri Fleksibel)
Kita ada Penambahan data Kita harus membongkar kueri Kita secara manual dan menambahkan `SUM(CASE WHEN...)` yang baru, berulang-ulang. Bagaimana jika kategorinya ada 100? Tangan Kita akan keriting!

DI sinilah Dynamic SQL masuk.
Alih-alih menulis kueri secara statis/kaku, Kita bisa menulis kueri dalam bentuk Teks (String), emanipulasinya menggunakan variable, lalu menyuruh mesin SQL untuk "Membaca dan Mengeksekusi teks tersebuh seolah-olah itu adalah kueri asli."

Sintaks Dasar Synamic SQL di MySQL:
``SET @kueri_saya = 'SELECT * FROM pelanggan';
PREPARE eksekusi_stmt FROM @kueri_saya;
EXECUTE eksekusi_stms;
DEALLOCATE PREPARE eksekusi_stms;``

Di tingkat Advanced, Kita bisa membuat Stored Procedure yang otomatis me-`LOOPING` daftar kategori yang ada. merakit teks kueri panjang berisi raturan `SUM(CASE WEHN...)`, lalu mengeksekusinya secara dinamis!