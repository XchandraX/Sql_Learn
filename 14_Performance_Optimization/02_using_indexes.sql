SELECT p.nama, o.total_harga, o.tanggal
FROM pesanan o
LEFT JOIN pelanggan p ON p.id_pelanggan = o.id_pelanggan
WHERE LEFT(p.kota, 7) = 'Jakarta' AND YEAR(o.tanggal) = 2026;

CREATE INDEX idx_tanggal ON pesanan (tanggal);
CREATE INDEX idx_kota ON pelanggan (kota);

SELECT p.nama, o.total_harga, o.tanggal
FROM pesanan o 
INNER JOIN pelanggan p ON p.id_pelanggan = o.id_pelanggan
WHERE p.kota = 'Jakarta' 
    AND o.tanggal BETWEEN '2026-01-01' AND '2026-12-30';

EXPLAIN SELECT p.nama, o.total_harga, o.tanggal
FROM pesanan o 
INNER JOIN pelanggan p ON p.id_pelanggan = o.id_pelanggan
WHERE p.kota = 'Jakarta' 
    AND o.tanggal BETWEEN '2026-01-01' AND '2026-12-30';