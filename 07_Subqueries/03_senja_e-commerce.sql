CREATE TABLE pelanggan(
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama_pelanggan VARCHAR(100) NOT NULL
);

CREATE TABLE pesanan(
    id_pesanan INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    Foreign Key (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    total_belanja INT
);

INSERT INTO pelanggan (nama_pelanggan) VALUES
('Alice'),
('Bob'),
('Charlie'),
('Diana');

INSERT INTO pesanan(id_pesanan,id_pelanggan, total_belanja) VALUES
(101, 1, 1500000),
(102, 1, 200000),
(103, 2, 3000000);

-- Gunakan IN
SELECT nama_pelanggan
FROM pelanggan 
WHERE id_pelanggan IN (
    SELECT id_pelanggan
    FROM pesanan
    WHERE total_belanja > 1000000
);

-- Gunakan NOT IN
SELECT nama_pelanggan
FROM pelanggan 
WHERE id_pelanggan NOT IN (
    SELECT id_pelanggan
    FROM pesanan
);