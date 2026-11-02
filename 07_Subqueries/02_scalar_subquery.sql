INSERT INTO menu_kopi (nama_menu, harga) VALUES
('Espresso', 15000),
('Americano', 20000),
('Latte', 25000),
('Matcha', 30000),
('Sinature Senja', 35000);

SELECT nama_menu, harga
FROM menu_kopi
WHERE harga >(
    SELECT AVG(harga) FROM menu_kopi
);

SELECT nama_menu, harga
FROM menu_kopi
WHERE harga = (
    SELECT MIN(harga) FROM menu_kopi
);

SELECT nama_menu
FROM menu_kopi
WHERE harga > (
    SELECT harga FROM menu_kopi 
    WHERE nama_menu = 'Matcha'
);