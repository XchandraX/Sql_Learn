-- Active: 1793677744104@@127.0.0.1@3306@KopiSenja

WITH RECURSIVE JadwalAbsen AS (
    SELECT 1 AS hari 

    UNION ALL

    SELECT hari + 1
    FROM JadwalAbsen
    WHERE hari < 7
)
SELECT * fROM JadwalAbsen;