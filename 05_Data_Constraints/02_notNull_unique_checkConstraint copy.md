# NOT NULL & UNIQUE
- `NOT NULL`: Memaksa sebuah kolom untuk selalu ada isinya. Jika aplikasi mengirimkan data kosong (NULL), database akan menolaknya dengan erro. Sangat coock untku kolom krusial seperti nama atau tanggal_lahir.

- `UNEQUE`: Memastikan tidak ada data yang kembar/duplikat di dolom tersebut pada seluruh tabel. Cocok untuk email, nomor_ktp, atau username.
    - Catatan: Apa bedanya dengan Primary Key (PK)? PK adlaah gabuangan NOT NULL + UNIQUE. Namun, dalam satu tabel hanya boleh ada 1 PK, sedangkan Kita bisa memasang UNIQUE di sebanyak mungkin kolom yang Kita mau.


# CHECK Constraint
ini adalah satpam yang paling cerdas karena bisa mengevaluasi logika matematika atau teks.

- Fungsi: Menguji data yang masuk dengan rumus tertentu
- Contoh Penggunaan:
    - Mencegah karyawan yang belum cukup umur: `CHECK (umur >= 18)`
    - Mencegah harga minus: `CHECK (harga > 0)`
    - Membatasi pilihan kata: `CHECK (status_pernikahan IN ('Lajang', 'Menikah', 'Cerai' ))`


# Tipe Penempatan Constraint (Column vs Table Level)
- Column-Level (Tingkah Kolom): Batasan ditulis langsung tepat di sebelah definisi kolom. Praktis untuk aturan yang hanya melibatkan satu kolom.

- Table_Level (Tingkat Tabel): Batasan dikumpulkan dan dituis di bagin paling bawah tabel. Wajib digunakan jika aturan melibatkan dua kolom atau lebih, atau jika Kita ingin memberi "nama" khusus pada aturan terseut agar mudah dihapus(`DROP CONSTRAINT`) di masa depan.