CREATE TABLE pengguna(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nama_user VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    tipe_langganan VARCHAR(20)
);

CREATE TABLE riwayat_tontonan(
    id_tonton INT PRIMARY KEY AUTO_INCREMENT,
    judul_film VARCHAR(100) NOT NULL,
    durasi_menit INT,
    id_user INT,
    Foreign Key (id_user) REFERENCES pengguna(id_user) 
    ON DELETE RESTRICT
);