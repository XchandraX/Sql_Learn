-- KASUS A: Bos minta tambahan kolom 'divisi'
ALTER TABLE karyawan
ADD COLUMN divisi VARCHAR(50);

-- KASUS B: ternyata nama karyawan ada yang sangat panjang (perbesar kapaistas)
-- Catatan: Sintks di bawah ini untuk MySQL. 
ALTER TABLE karyawan
MODIFY COLUMN nama_lengkap VARCHAR(150);


-- KASUS C: Kolom 'status_aktif' tidak jadi dipakai, hapus saja
ALTER TABLE karyawan
DROP COLUMN status_aktif;