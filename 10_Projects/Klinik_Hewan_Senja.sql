CREATE TABLE pemilik(
    id_pemilik INT PRIMARY KEY AUTO_INCREMENT,
    nama_pemilik VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15) UNIQUE
);

CREATE TABLE hewan(
    id_hewan INT PRIMARY KEY AUTO_INCREMENT,
    nama_hewan VARCHAR(100) NOT NULL,
    spesies VARCHAR(50),
    CHECK (spesies IN ('Kucing', 'Anjing', 'Kelinci')),
    id_pemilik INT,
    Foreign Key (id_pemilik) REFERENCES pemilik(id_pemilik)
    ON DELETE RESTRICT 
);

INSERT INTO pemilik(nama_pemilik, no_hp) VALUES
('Chandra', '0832545435'),
('Muamar', '0843569354'),
('Adam', '0843523585');

INSERT INTO hewan(nama_hewan, spesies, id_pemilik) VALUES
('Anit', 'Anjing', 2),
('Alex', 'Kucing', 1),
('Chintiya', 'Kelinci', 1);

SELECT p.nama_pemilik, h.nama_hewan, h.spesies
FROM pemilik p
LEFT JOIN hewan h ON p.id_pemilik = h.id_pemilik;

SELECT p.nama_pemilik, h.nama_hewan, h.spesies
FROM pemilik p
LEFT JOIN hewan h ON p.id_pemilik = h.id_pemilik
WHERE id_hewan IS NULL;

SELECT p.nama_pemilik, h.nama_hewan
FROM pemilik p
CROSS JOIN hewan h;
