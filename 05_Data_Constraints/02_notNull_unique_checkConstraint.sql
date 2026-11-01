CREATE TABLE peserta_lomba (
    -- COLUMN-LEEVL CONSTRAINTS (Ditulis di sebewlah kolom)
    id_peserta INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    umur INT CHECK (umur >= 15),
    -- TABEL- LEVEL CONTRAINTS (Ditulis di bawah)
    poin_tes INT,
    poin_wawancara INT,
    -- Membuat nama constraint khusus (total_poin) menggunakan dua kolom
    CONSTRAINT total_poin CHECK (poin_tes + poin_wawancara <= 100)
);