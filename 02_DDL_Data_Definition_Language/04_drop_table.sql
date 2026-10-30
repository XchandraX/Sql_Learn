-- Menghancurkan tabel beserta seluruh struktur dan data di dalamnya.
DROP TABLE karyawan;

-- Praktik terbaik (aman dari error jika tabel ternyata tidak ada)
DROP TABLE IF EXISTS karyawan;