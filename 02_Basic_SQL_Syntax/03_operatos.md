# Operator SQL
bertindak sebagai mesim inferensi dan kalkulasi di dalam RDBMS. 
Mereka adalah konjungsi logis dan matematis yang mengubah sekumpulan data mentah menjadi informasi yang memiliki konteks. Pemahaman emndalam tentang operator tidak hanya krusial untuk menghasilkan kueri yang sintaksisnya benar, tetapi juga esensial untuk menulis kueri yang efisien secara komputasi dan mampu memanfaatkan indeks dengna maksimal.

## Operator Aritmatika & Implikasi SARGability
Operator ini (+, -, *, /, % atau modulo) melakukan komputasi metematis tingkas baris pada kolom numberik atau temporal.

- Penerapan Lanjutan: Selain kakulasi standar, operator ini sering digunakan untuk memanipulasi tanggal (misalnya menambahkan 30 hari ke tanggal jatuh tempo).

- Implikasi Kinerja (SARGability): Menggunakan operator aritmatika pada sisi kolom dalam klausa WHERE akan menghancurkan kemampuan mesin untuk menggunakan Indeks (kondisi Non-SARGable)
    - Buruk: WHERE Gaji * 1.1 > 5000 (Sistem harus menghitung seluruh baris sebelum membandingkan, mengabaikan indeks)
    Optimal: WEHRE Gaji > 5000 / 1.1 (Kalkulasi dilakukan sekali di memori, dan indeks Gaji dapat digunakan secara penuh)

## Operator Perbandingkan & Logika Tiga-Nilai (Three-Valued Logic)
Operator perbandingan (=, !=, <>, >, <, >=, <=) membandingkan dua ekspresi dan mengembalikan nilai boolean.

- Jebakan NULL: SQL tidak menggunakan logika biner tradisional (Benar/Salah), melainkan Three-Valued Logic (Benar, Salah, Tidak Diketahui/NULL). Membandingkan apa pun dengan NULL menggunakan operator = atau != akan selalu menghasilkan NULL (Tidak Diketahui), bukan salah.

- Operator Spesifik NULL: Untuk mengatasi hal di atas, SQL menyediakan operator IS NULL dan IS NOT NULL. Beberapa RDBMS modern seperti MySQL jug amenyediakan NULL-safe equal operator(<=>) yang memungkinkan perbandingkan nilai yang secara aman menganggap dua NULL sebagai identik.

## Operator Logika & Prioritas Eksekusi (Precedence)
Menggabungkan beberapa kondisi memerlukan operator AND, OR, dan NOT. Di sinilah evaluasi short-circuit dan prioritas operasi memainkan peran penting.

- Prioritas (Order of Operations): Secara default, SQL mengevaluasi AND sebelum OR. Kueri WHERE A OR B AND C akan dibaca oleh mesin sebagi WHERE A OR (B AND C). Kesalahan dalam menepatkan tanda () adlaah salah satu penyebab anomali data (bug) paling umum dalam laporan analitik.

- Evaluasi Short-Circuit: Mesin SQL dioptimallkan untuk berhenti mengevaluasi segera setelah hasilnya pasti. Jika menggunakan A AND B dan kondisi A sudah bernilai False, sistem tidak akan membuang siklus CPU untuk mengevaluasi B.

## Operator Spesifik Relasional dan Pola
SQL membekali pengembang dengan operator perbandingan tingkat lanjut yang dirancang khusus untuk struktur relasional:
- BETWEEN (Rentang Inklusif): Lebih bersih dan efisien daripada A >= 1 AND A <= 10. Hati-hati saat menggunakan BETWEEN pada tipe data DATETIME, karena tanpa spesifikasi jam, tanggal batas akhir akan dievaluasi pada tepat pukul 00:00:00 (tengah malam).

- IN (Keanggotaan Himpunan): mengevaluasi apakah sebuah nilai cocok dengan salah satu dari sekumpulan nilai dalam daftar. Secara internal, IN (1, 2, 3) dioptimalkan jauh lebih baik oleh query optimizer dibandingkan rentetan OR (A = 1 OR A = 2 OR A = 3).

LIKE (Pola Karakter): Menggunakan karakter wildcard % (nol atau banyak karakter) dan _ (tepat satu karakter). Menggunakan leading wildcard seperti LIKE '%kata' memaksa sistem melakukan Full Table Scan (pemindaian memori penuh) karena tidak dapat membaca indeks dari kiri ke kanan

## Operator Eksistensi (Subquery Evaluation)
- EXISTS dan NOT EXISTS: Digunakan secara eksklusif untuk mengevaluasi apakah sebuah subquery mengembalikan setidaknya satu baris. Secara performa, EXISTS sangat efisien utnuk tabel masif karena ia beroperasi menggunakan logika "berhenti pada kecocokan pertama" (early out/ semi-join), berbeda dengan IN yang memuat seluruh set hasil subquery ke dalam memori

## Operator Himpunan (Set Operations)
Berbeda dengan JOIN yang menggabungkan kolom dari tabel berbeda secara horizontal, operator himpunan menggabungkan hasil dari dua atau lebih kueri SELECT secara vertikal (menumpuk baris data).

- UNION: Menggabungkan set data dan secara otomatis menghapus baris duplikat. Proses deduplikasi ini memaksa server melakukan operasi pengurutan (sorting) berat di balik layar.

- UNION ALL: menggabungkan set data tanpa membuang duplikat. Ini secara signifikan lebih ringan dan cepat. Jika Kita yakin data tidak memiliki duplikat, selalu gunakan UNION ALL daripada UNION.

- INTERSECT: Hanya mengembalikan baris yang secara identik ada di kedua hasil kueri

- EXCEPT (atau MINUS): Mengurangi set hasil. Mengembalikan baris dari kueri pertama yang tidak muncul di kueri kedua. Sangat berguna untuk sinkronisasi data taau mencari anomali data (misalnya: mencari pelanggan yang tidak memiliki transaksi dalam 6 bulan terakhir).