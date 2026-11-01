-- Create riwayat_tontonan
CREATE TABLE riwayat_tontonan(
    id_tonton INT PRIMARY KEY AUTO_INCREMENT,
    judul_film VARCHAR(100) NOT NULL,
    genre VARCHAR(29) NOT NULL,
    tipe_langganan VARCHAR(10) NOT NULL,
    durasi_menit INT,
    rating DECIMAL(2, 1)
);

-- Insert mengisi data
INSERT INTO riwayat_tontonan (judul_film, genre, tipe_langganan, durasi_menit, rating) VALUES 
('Minecraft Viva Fantasy', 'Fantasy', 'Premium', 180, 5.0),
('The Dark Knight', 'Action', 'Premium', 152, 4.9),
('Die Hard', 'Action', 'Basic', 132, 4.5),
('Superbad', 'Comedy', 'Basic', 113, 4.2),
('Get Out', 'Horror', 'Premium', 104, 4.6),
('Interstellar', 'Sci-Fi', 'Premium', 169, 4.8),
('The Hangover', 'Comedy', 'Basic', 100, 4.4);

-- Kueri Masterpiece
SELECT 
    genre,
    SUM(durasi_menit) AS total_durasi,
    AVG(rating) AS rata_rating
FROM riwayat_tontonan
WHERE tipe_langganan = 'Premium'
GROUP BY genre
HAVING SUM(durasi_menit) > 120
ORDER BY total_durasi DESC;


-- Select kolom
SELECT genre, SUM(durasi_menit), AVG(rating)
FROM riwayat_tontonan
GROUP BY genre;

-- WHERE and GROUP BY
SELECT judul_film, genre, COUNT(tipe_langganan) 
FROM riwayat_tontonan
WHERE tipe_langganan = 'Premium'
GROUP BY genre, judul_film;

-- HAVING
SELECT genre, SUM(durasi_menit)
FROM riwayat_tontonan
GROUP BY genre
HAVING SUM(durasi_menit) > 120
ORDER BY SUM(durasi_menit) DESC;
