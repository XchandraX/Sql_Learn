# RDBMS Benefits and Limitations
Jaminan transaksi (ACID) dan skema yang kaku memang menjadi dua sisi mata uang yang menentukan kapan sistem ini palnig optimal digunakan.

Batasan yang Anda sebutkan mengenai skalabilitas dan data tidak terstruktur sering kali menjadi alasan utama mengapa banyak arsitektur sistem modern menggunakan basis data non-relasional (NoSQL) sebagai pendamping:

| Aspek | Karakteristik RDBMS | Alternatif (NoSQL) |
| :---: | :---: | :---: |
| Fokus Utama | Transaksi yang andal (ACID) dan integritas data ketat. | Fleksibilitas pengembangan dan kecepatan akses. |
| Struktur Data | Terstruktur (Baris dan kolom yang harus didefinisikan di awal). | Semi/Tidak terstruktur (JSON, Dokumen, Key-Value). |
|Pendekatan Skalabilitas | Vertikal (Scale-up - harus meng-upgrade RAM/CPU pada server yang sama). | Horizontal (Scale-out - dapat menambah banyak server komoditas dengan mudah). |

Keterbatasan RDBMS dalam skalabilitas horizontal inilah yang membuatnya kewalahan saat menhadapi Big Data atau aplikasi berskala global dengan jutaan opersai per detik, di mana menyebarkan beban ke banyak server lebih efektif daripada terus-menerus memperbesar ukuran satu server pusat.