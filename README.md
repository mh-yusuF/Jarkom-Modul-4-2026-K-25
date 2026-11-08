# Jarkom-Modul-4-2026-K-25

## Anggota
| Nama | NRP | 
|---|---|
| Muhammad Yusuf | 5027251067 |
| Azhari Rahma Putri | 5027251114 |

## Laporan


## 1.1 Pendahuluan

Pada praktikum ini dilakukan perancangan jaringan komputer menggunakan metode subnetting Variable Length Subnet Mask (VLSM). Metode VLSM digunakan untuk membagi satu blok alamat IP menjadi beberapa subnet dengan ukuran yang berbeda sesuai kebutuhan jumlah host pada setiap jaringan.

Perancangan jaringan dilakukan berdasarkan topologi yang telah ditentukan dalam soal praktikum. Setiap node memiliki kebutuhan host yang berbeda sehingga diperlukan pembagian alamat IP yang efisien agar penggunaan alamat tidak berlebihan.

Blok alamat IP yang digunakan dalam praktikum ini adalah **10.76.0.0/19**. Pembagian subnet dilakukan berdasarkan jumlah host pada setiap node dan kebutuhan alamat IP untuk koneksi antarrouter.

## 1.2 Tujuan Praktikum

1. Memahami konsep subnetting menggunakan metode VLSM.
2. Menghitung kebutuhan alamat IP berdasarkan jumlah host pada setiap jaringan.
3. Membagi satu blok jaringan menjadi beberapa subnet dengan prefix yang berbeda.
4. Menentukan network address, subnet mask, rentang IP host, dan broadcast address.
5. Menyusun perencanaan pengalamatan IP sebagai dasar pembuatan topologi dan konfigurasi perangkat jaringan.

## 1.3 Informasi Jaringan

Blok alamat IP yang diberikan untuk praktikum adalah:

| Keterangan | Nilai |
|---|---|
| Network awal | 10.76.0.0 |
| Prefix awal | /19 |
| Subnet mask | 255.255.224.0 |
| Total alamat IP | 8.192 |
| Alamat IP yang dapat digunakan | 8.190 |
| Rentang alamat | 10.76.0.0 – 10.76.31.255 |

Blok jaringan /19 memiliki kapasitas 8.192 alamat IP. Alamat tersebut kemudian dibagi menjadi beberapa subnet sesuai kebutuhan host pada topologi.

## 1.4 Identifikasi Kebutuhan Host

Sebelum melakukan perhitungan VLSM, terlebih dahulu dilakukan identifikasi kebutuhan host pada setiap node. Kebutuhan host mencakup perangkat akhir dan interface router yang berada dalam subnet tersebut.

Berikut merupakan kebutuhan host berdasarkan topologi praktikum:

| Subnet | Koneksi/Jaringan | Kebutuhan Host |
|---|---|---:|
| A1 | Cyberia – Switch1 – JJ dan MyuMyu | 126 |
| A2 | Cyberia – Wired | 2 |
| A3 | Wired – Switch2 – Psyche, Copland, Schumann | 4 |
| A4 | Psyche – Switch3 – Karl dan Lin | 881 |
| A5 | Copland – Switch4 – Masayuki | 301 |
| A6 | Copland – Juri | 32 |
| A7 | Schumann – Akashic | 4 |
| A8 | Schumann – Accela | 2 |
| A9 | Accela – Switch8 – Omnipresence dan Denpa | 514 |
| A10 | Wired – Navi | 2 |
| A11 | Navi – Switch4 – Alice dan Reika | 254 |
| A12 | Navi – Switch3 – Taro | 58 |
| A13 | Navi – Switch2 – Yasuo, Miho, dan Kuma | 143 |
| A14 | Wired – Tachibana | 2 |
| A15 | Tachibana – Switch9 – Collective dan Ghost | 267 |
| A16 | Tachibana – Deus | 2 |
| A17 | Deus – Switch10 – Lilith dan Specter | 99 |
| A18 | Deus – Protocol7 | 2 |
| A19 | Protocol7 – Switch11 – Chisa dan Hodgeson | 33 |
| A20 | Protocol7 – Knights | 2 |
| A21 | Knights – Eiri | 3 |
| A22 | Knights – Phantoma | 2 |
| A23 | Phantoma – Switch12 – Semi | 15 |
| A24 | Phantoma – Shibuya | 2 |
| A25 | Shibuya – Switch13 – Lain dan Mika | 62 |
| **Total** | | **2.814** |

Kebutuhan host pada setiap subnet menjadi dasar dalam menentukan prefix dan subnet mask yang sesuai. Untuk jaringan yang menghubungkan dua router secara langsung, dibutuhkan dua alamat IP yang dapat digunakan, yaitu satu untuk masing-masing interface router.

## 1.5 Dasar Perhitungan VLSM

Metode VLSM dilakukan dengan membagi jaringan berdasarkan kebutuhan host, dimulai dari kebutuhan host terbesar hingga terkecil.

Tahapan perhitungannya adalah sebagai berikut:

1. Mengidentifikasi jumlah host yang dibutuhkan pada setiap subnet.
2. Mengurutkan kebutuhan host dari jumlah terbesar hingga terkecil.
3. Menentukan jumlah bit host yang diperlukan menggunakan rumus:

   **2^h - 2 ≥ jumlah host**

   Keterangan:
   - h = jumlah bit yang digunakan untuk host.
   - 2^h = jumlah seluruh alamat dalam subnet.
   - 2 alamat dikurangi untuk network address dan broadcast address.

4. Menentukan prefix dengan rumus:

   **Prefix = 32 - h**

5. Menentukan subnet mask berdasarkan prefix yang diperoleh.
6. Mengalokasikan alamat IP secara berurutan, dimulai dari network address 10.76.0.0.
7. Memastikan setiap subnet tidak saling tumpang tindih dan seluruh kebutuhan host dapat terpenuhi.

### Contoh Perhitungan Subnet A4

Subnet A4 memiliki kebutuhan sebanyak 881 host.

Menentukan jumlah bit host:

2^9 - 2 = 510 (belum mencukupi).

2^10 - 2 = 1.022 (mencukupi).

Dengan demikian, jumlah bit host yang dibutuhkan adalah 10 bit.

Prefix:

32 - 10 = 22

Maka subnet A4 menggunakan prefix **/22** dengan subnet mask **255.255.252.0**.

Kapasitas alamat:
- Total alamat: 1.024.
- Alamat yang dapat digunakan: 1.022.
- Kebutuhan host: 881.

Dengan kapasitas tersebut, subnet A4 dapat memenuhi kebutuhan host yang ditentukan.

## 1.6 Hasil Pembagian Subnet VLSM

Setelah seluruh kebutuhan host diurutkan dari yang terbesar hingga terkecil, dilakukan alokasi alamat IP secara berurutan dari blok jaringan 10.76.0.0/19.

Hasil pembagian subnet adalah sebagai berikut:

| Subnet | Kebutuhan Host | Prefix | Subnet Mask |
|---|---:|---:|---|
| A4 | 881 | /22 | 255.255.252.0 |
| A9 | 514 | /22 | 255.255.252.0 |
| A5 | 301 | /23 | 255.255.254.0 |
| A15 | 267 | /23 | 255.255.254.0 |
| A11 | 254 | /24 | 255.255.255.0 |
| A13 | 143 | /24 | 255.255.255.0 |
| A1 | 126 | /25 | 255.255.255.128 |
| A17 | 99 | /25 | 255.255.255.128 |
| A25 | 62 | /26 | 255.255.255.192 |
| A12 | 58 | /26 | 255.255.255.192 |
| A19 | 33 | /26 | 255.255.255.192 |
| A6 | 32 | /26 | 255.255.255.192 |
| A23 | 15 | /27 | 255.255.255.224 |
| A3 | 4 | /29 | 255.255.255.248 |
| A7 | 4 | /29 | 255.255.255.248 |
| A21 | 3 | /29 | 255.255.255.248 |
| A2 | 2 | /30 | 255.255.255.252 |
| A8 | 2 | /30 | 255.255.255.252 |
| A10 | 2 | /30 | 255.255.255.252 |
| A14 | 2 | /30 | 255.255.255.252 |
| A16 | 2 | /30 | 255.255.255.252 |
| A18 | 2 | /30 | 255.255.255.252 |
| A20 | 2 | /30 | 255.255.255.252 |
| A22 | 2 | /30 | 255.255.255.252 |
| A24 | 2 | /30 | 255.255.255.252 |

## 1.7 Tabel Pembagian Alamat IP VLSM

Berikut merupakan hasil alokasi alamat IP untuk setiap subnet berdasarkan perhitungan VLSM:

| Subnet | Network Address | Rentang IP Host | Broadcast |
|---|---|---|---|
| A4 | 10.76.0.0/22 | 10.76.0.1 – 10.76.3.254 | 10.76.3.255 |
| A9 | 10.76.4.0/22 | 10.76.4.1 – 10.76.7.254 | 10.76.7.255 |
| A5 | 10.76.8.0/23 | 10.76.8.1 – 10.76.9.254 | 10.76.9.255 |
| A15 | 10.76.10.0/23 | 10.76.10.1 – 10.76.11.254 | 10.76.11.255 |
| A11 | 10.76.12.0/24 | 10.76.12.1 – 10.76.12.254 | 10.76.12.255 |
| A13 | 10.76.13.0/24 | 10.76.13.1 – 10.76.13.254 | 10.76.13.255 |
| A1 | 10.76.14.0/25 | 10.76.14.1 – 10.76.14.126 | 10.76.14.127 |
| A17 | 10.76.14.128/25 | 10.76.14.129 – 10.76.14.254 | 10.76.14.255 |
| A25 | 10.76.15.0/26 | 10.76.15.1 – 10.76.15.62 | 10.76.15.63 |
| A12 | 10.76.15.64/26 | 10.76.15.65 – 10.76.15.126 | 10.76.15.127 |
| A19 | 10.76.15.128/26 | 10.76.15.129 – 10.76.15.190 | 10.76.15.191 |
| A6 | 10.76.15.192/26 | 10.76.15.193 – 10.76.15.254 | 10.76.15.255 |
| A23 | 10.76.16.0/27 | 10.76.16.1 – 10.76.16.30 | 10.76.16.31 |
| A3 | 10.76.16.32/29 | 10.76.16.33 – 10.76.16.38 | 10.76.16.39 |
| A7 | 10.76.16.40/29 | 10.76.16.41 – 10.76.16.46 | 10.76.16.47 |
| A21 | 10.76.16.48/29 | 10.76.16.49 – 10.76.16.54 | 10.76.16.55 |
| A2 | 10.76.16.56/30 | 10.76.16.57 – 10.76.16.58 | 10.76.16.59 |
| A8 | 10.76.16.60/30 | 10.76.16.61 – 10.76.16.62 | 10.76.16.63 |
| A10 | 10.76.16.64/30 | 10.76.16.65 – 10.76.16.66 | 10.76.16.67 |
| A14 | 10.76.16.68/30 | 10.76.16.69 – 10.76.16.70 | 10.76.16.71 |
| A16 | 10.76.16.72/30 | 10.76.16.73 – 10.76.16.74 | 10.76.16.75 |
| A18 | 10.76.16.76/30 | 10.76.16.77 – 10.76.16.78 | 10.76.16.79 |
| A20 | 10.76.16.80/30 | 10.76.16.81 – 10.76.16.82 | 10.76.16.83 |
| A22 | 10.76.16.84/30 | 10.76.16.85 – 10.76.16.86 | 10.76.16.87 |
| A24 | 10.76.16.88/30 | 10.76.16.89 – 10.76.16.90 | 10.76.16.91 |

## 1.8 Analisis Hasil Pembagian Subnet

Berdasarkan hasil perhitungan, blok alamat 10.76.0.0/19 berhasil dibagi menjadi 25 subnet dengan prefix yang bervariasi, mulai dari /22 hingga /30.

Penggunaan prefix yang berbeda memungkinkan setiap jaringan memperoleh kapasitas alamat IP sesuai kebutuhannya. Subnet dengan kebutuhan host besar memperoleh kapasitas alamat yang lebih besar, sedangkan koneksi antarrouter menggunakan subnet /30 karena hanya membutuhkan dua alamat IP yang dapat digunakan.

Seluruh alokasi subnet berada dalam rentang blok 10.76.0.0/19 dan tidak saling bertumpang tindih. Alokasi terakhir berada pada subnet A24 dengan network address 10.76.16.88/30, sehingga masih terdapat ruang alamat IP yang belum digunakan dalam blok jaringan tersebut.

Dengan demikian, hasil perhitungan VLSM ini dapat digunakan sebagai dasar dalam pembuatan topologi dan konfigurasi perangkat jaringan pada tahap selanjutnya.

---

## 2.1 Perancangan Topologi Jaringan

Setelah melakukan perhitungan subnetting menggunakan metode VLSM, tahap selanjutnya adalah membuat topologi jaringan berdasarkan rancangan yang telah ditentukan dalam soal praktikum.

Topologi dibuat menggunakan aplikasi Cisco Packet Tracer dengan menghubungkan beberapa router, switch, dan end device. Setiap router berfungsi untuk menghubungkan jaringan yang berbeda, sedangkan switch digunakan untuk menghubungkan beberapa perangkat dalam satu jaringan lokal (LAN).

Dalam topologi ini, router Cyberia menjadi pusat koneksi menuju Cloud-PT. Router Wired berperan sebagai penghubung utama antara Cyberia dan beberapa router lainnya. Selanjutnya, jaringan didistribusikan melalui router-router lain sesuai jalur yang telah ditentukan pada topologi.

## 2.2 Perangkat yang Digunakan

Perangkat yang digunakan dalam pembuatan topologi jaringan adalah sebagai berikut:

| No. | Perangkat | Jumlah | Fungsi |
|---|---|---:|---|
| 1 | Router Cisco 2811 | 13 | Menghubungkan subnet dan meneruskan paket data antarjaringan. |
| 2 | Switch-PT | 13 | Menghubungkan beberapa end device atau router dalam satu segmen jaringan. |
| 3 | PC-PT | Sesuai topologi | Mewakili perangkat komputer pengguna dalam jaringan. |
| 4 | Laptop-PT | Sesuai topologi | Mewakili perangkat laptop pengguna dalam jaringan. |
| 5 | Server-PT | 2 | Mewakili server pada jaringan yang terhubung ke router Psyche. |
| 6 | Cloud-PT | 1 | Mewakili koneksi jaringan eksternal atau NAT/Cloud. |

Jumlah router sebanyak 13 unit terdiri atas Cyberia, Wired, Psyche, Copland, Schumann, Accela, Navi, Tachibana, Deus, Protocol7, Knights, Phantoma, dan Shibuya.

Terdapat 13 switch yang digunakan untuk menghubungkan perangkat pada jaringan lokal. Selain itu, terdapat 25 node akhir yang mewakili kebutuhan host pada topologi, termasuk dua server.

## 2.3 Perangkat Router dan Modul Interface

Router yang digunakan adalah Cisco 2811. Router berfungsi sebagai penghubung antarjaringan dengan meneruskan paket data berdasarkan tabel routing.

Pada praktikum ini, koneksi antarrouter dan koneksi router menuju jaringan lokal menggunakan interface FastEthernet.

Router Cisco 2811 memiliki interface bawaan yang jumlahnya terbatas. Oleh karena itu, beberapa router memerlukan penambahan modul agar tersedia interface tambahan sesuai kebutuhan koneksi pada topologi.

Penambahan modul dilakukan melalui tab Physical pada perangkat router dengan mematikan daya perangkat terlebih dahulu, memasang modul pada slot yang tersedia, kemudian menyalakan kembali router.

Modul tambahan yang digunakan disesuaikan dengan kebutuhan interface FastEthernet pada masing-masing router. Jenis dan jumlah modul mengikuti slot serta interface yang benar-benar digunakan pada file Cisco Packet Tracer.

## 2.4 Daftar Router dan Hubungan Antarjaringan

Berikut merupakan daftar router yang digunakan beserta jaringan yang terhubung pada masing-masing router:

| No. | Router | Jaringan atau Koneksi yang Dilayani |
|---|---|---|
| 1 | Cyberia | LAN A1 dan koneksi A2 menuju Wired serta Cloud-PT. |
| 2 | Wired | Koneksi menuju Cyberia, Psyche, Copland, Schumann, Navi, dan Tachibana melalui jaringan yang telah dirancang. |
| 3 | Psyche | LAN A4 dan koneksi A3 menuju Wired. |
| 4 | Copland | LAN A5, koneksi A6 menuju Juri, dan koneksi A3 menuju Wired. |
| 5 | Schumann | Koneksi A3 menuju Wired, A7 menuju Akashic, dan A8 menuju Accela. |
| 6 | Accela | LAN A9 dan koneksi A8 menuju Schumann. |
| 7 | Navi | LAN A11, A12, A13, serta koneksi A10 menuju Wired. |
| 8 | Tachibana | LAN A15, koneksi A14 menuju Wired, dan A16 menuju Deus. |
| 9 | Deus | LAN A17, koneksi A16 menuju Tachibana, dan A18 menuju Protocol7. |
| 10 | Protocol7 | LAN A19, koneksi A18 menuju Deus, dan A20 menuju Knights. |
| 11 | Knights | Koneksi A20 menuju Protocol7, A21 menuju Eiri, dan A22 menuju Phantoma. |
| 12 | Phantoma | LAN A23, koneksi A22 menuju Knights, dan A24 menuju Shibuya. |
| 13 | Shibuya | LAN A25 dan koneksi A24 menuju Phantoma. |

## 2.5 Hubungan Switch dan End Device

Switch digunakan sebagai penghubung perangkat dalam satu jaringan lokal. Setiap switch dihubungkan ke interface router yang berfungsi sebagai gateway bagi perangkat-perangkat pada jaringan tersebut.

Hubungan switch dengan end device berdasarkan pembagian subnet adalah sebagai berikut:

| Subnet | Router | Switch | End Device |
|---|---|---|---|
| A1 | Cyberia | Switch1 | JJ dan MyuMyu |
| A3 | Wired | Switch2 | Psyche, Copland, dan Schumann |
| A4 | Psyche | Switch6 | Karl dan Lin |
| A5 | Copland | Switch sesuai topologi | Masayuki |
| A9 | Accela | Switch8 | Omnipresence dan Denpa |
| A11 | Navi | Switch4 | Alice dan Reika |
| A12 | Navi | Switch3 | Taro |
| A13 | Navi | Switch2 | Yasuo, Miho, dan Kuma |
| A15 | Tachibana | Switch9 | Collective dan Ghost |
| A17 | Deus | Switch10 | Lilith dan Specter |
| A19 | Protocol7 | Switch11 | Chisa dan Hodgeson |
| A23 | Phantoma | Switch12 | Semi |
| A25 | Shibuya | Switch13 | Lain dan Mika |

Selain jaringan yang menggunakan switch, terdapat beberapa koneksi langsung antara router dan end device, yaitu:

| Subnet | Router | End Device |
|---|---|---|
| A6 | Copland | Juri |
| A7 | Schumann | Akashic |
| A21 | Knights | Eiri |

**Catatan:** Penamaan switch pada tabel mengikuti identitas perangkat di topologi. Switch2 digunakan untuk jaringan A3 dan A13 apabila keduanya memang merupakan segmen yang terhubung ke switch yang sama pada rancangan aktual. Pastikan kembali label perangkat pada file Packet Tracer sebelum mengambil dokumentasi akhir.

## 2.6 Proses Pembuatan Topologi di Cisco Packet Tracer

Pembuatan topologi dilakukan melalui beberapa tahapan berikut:

1. Membuka Cisco Packet Tracer dan membuat project baru.
2. Menambahkan 13 router Cisco 2811 ke area kerja.
3. Mengganti nama setiap router sesuai rancangan, yaitu Cyberia, Wired, Psyche, Copland, Schumann, Accela, Navi, Tachibana, Deus, Protocol7, Knights, Phantoma, dan Shibuya.
4. Memeriksa kebutuhan interface pada setiap router.
5. Menambahkan modul FastEthernet apabila interface bawaan tidak mencukupi.
6. Menambahkan switch sesuai kebutuhan jaringan lokal.
7. Menambahkan PC, laptop, dan server sesuai node pada topologi.
8. Mengganti nama setiap end device sesuai nama yang telah ditentukan.
9. Menghubungkan router dengan router, router dengan switch, serta switch dengan end device menggunakan kabel yang sesuai.
10. Menghubungkan router Cyberia ke Cloud-PT sebagai satu-satunya koneksi menuju NAT/Cloud.
11. Merapikan posisi perangkat agar hubungan antarjaringan mudah dibaca.

## 2.7 Jenis Kabel yang Digunakan

Jenis kabel ditentukan berdasarkan perangkat yang dihubungkan.

| Hubungan Perangkat | Jenis Kabel |
|---|---|
| Router ke Switch | Copper Straight-Through |
| Switch ke PC/Laptop/Server | Copper Straight-Through |
| Router ke Router melalui Ethernet | Copper Cross-Over atau kabel yang didukung Auto-MDIX |
| Router ke Cloud-PT | Disesuaikan dengan interface dan jenis koneksi yang tersedia |

Pada praktikum ini, koneksi antarrouter menggunakan FastEthernet. Pemilihan jenis kabel disesuaikan dengan interface perangkat dan kondisi koneksi pada Cisco Packet Tracer.

## 2.8 Hasil Pembuatan Topologi

Setelah seluruh perangkat ditempatkan dan dihubungkan, terbentuk topologi jaringan yang terdiri atas 13 router, 13 switch, 25 node akhir, dan satu Cloud-PT.

Topologi tersebut merepresentasikan beberapa jaringan lokal yang saling terhubung melalui router. Setiap jaringan menggunakan subnet yang telah dihitung pada Bagian I.

Router Cyberia menjadi satu-satunya router yang dihubungkan ke Cloud-PT sesuai ketentuan soal. Sementara itu, router Wired menjadi penghubung utama antara Cyberia dan jaringan internal lainnya.

Pada tahap ini, pembuatan topologi fisik telah dilakukan sebagai dasar untuk konfigurasi alamat IP, gateway, dan routing pada tahap berikutnya.

## 3.1 Konfigurasi Alamat IP pada Router

Setelah topologi jaringan selesai dibuat, tahap berikutnya adalah melakukan konfigurasi alamat IP pada setiap interface router. Konfigurasi dilakukan berdasarkan hasil pembagian subnet VLSM pada Bagian I.

Setiap interface router diberikan alamat IP sesuai subnet yang terhubung dengannya. Interface yang mengarah ke jaringan lokal berfungsi sebagai gateway bagi end device, sedangkan interface yang mengarah ke router lain digunakan untuk komunikasi antarjaringan.

Konfigurasi dilakukan melalui CLI Cisco Packet Tracer dengan tahapan umum sebagai berikut:

1. Membuka perangkat router.
2. Memilih tab CLI.
3. Masuk ke privileged EXEC mode.
4. Masuk ke global configuration mode.
5. Memilih interface yang akan dikonfigurasi.
6. Memasukkan alamat IP dan subnet mask.
7. Mengaktifkan interface menggunakan perintah `no shutdown`.

Contoh konfigurasi interface router:

```cisco
enable
configure terminal
interface fastethernet 0/0
ip address 10.76.16.58 255.255.255.252
no shutdown
exit
```

Perintah tersebut merupakan contoh konfigurasi interface Wired pada subnet A2. Nama interface disesuaikan dengan port yang benar-benar digunakan pada topologi.

## 3.2 Tabel Pengalamatan IP pada Router

Berikut merupakan pembagian alamat IP untuk setiap interface router berdasarkan hasil VLSM.

| Router | Subnet | Alamat IP Interface | Subnet Mask |
|---|---|---|---|
| Cyberia | A1 | 10.76.14.1 | 255.255.255.128 |
| Cyberia | A2 | 10.76.16.57 | 255.255.255.252 |
| Wired | A2 | 10.76.16.58 | 255.255.255.252 |
| Wired | A3 | 10.76.16.33 | 255.255.255.248 |
| Wired | A10 | 10.76.16.65 | 255.255.255.252 |
| Wired | A14 | 10.76.16.69 | 255.255.255.252 |
| Psyche | A3 | 10.76.16.34 | 255.255.255.248 |
| Psyche | A4 | 10.76.0.1 | 255.255.252.0 |
| Copland | A3 | 10.76.16.35 | 255.255.255.248 |
| Copland | A5 | 10.76.8.1 | 255.255.254.0 |
| Copland | A6 | 10.76.15.193 | 255.255.255.192 |
| Schumann | A3 | 10.76.16.36 | 255.255.255.248 |
| Schumann | A7 | 10.76.16.41 | 255.255.255.248 |
| Schumann | A8 | 10.76.16.61 | 255.255.255.252 |
| Accela | A8 | 10.76.16.62 | 255.255.255.252 |
| Accela | A9 | 10.76.4.1 | 255.255.252.0 |
| Navi | A10 | 10.76.16.66 | 255.255.255.252 |
| Navi | A11 | 10.76.12.1 | 255.255.255.0 |
| Navi | A12 | 10.76.15.65 | 255.255.255.192 |
| Navi | A13 | 10.76.13.1 | 255.255.255.0 |
| Tachibana | A14 | 10.76.16.70 | 255.255.255.252 |
| Tachibana | A15 | 10.76.10.1 | 255.255.254.0 |
| Tachibana | A16 | 10.76.16.73 | 255.255.255.252 |
| Deus | A16 | 10.76.16.74 | 255.255.255.252 |
| Deus | A17 | 10.76.14.129 | 255.255.255.128 |
| Deus | A18 | 10.76.16.77 | 255.255.255.252 |
| Protocol7 | A18 | 10.76.16.78 | 255.255.255.252 |
| Protocol7 | A19 | 10.76.15.129 | 255.255.255.192 |
| Protocol7 | A20 | 10.76.16.81 | 255.255.255.252 |
| Knights | A20 | 10.76.16.82 | 255.255.255.252 |
| Knights | A21 | 10.76.16.49 | 255.255.255.248 |
| Knights | A22 | 10.76.16.85 | 255.255.255.252 |
| Phantoma | A22 | 10.76.16.86 | 255.255.255.252 |
| Phantoma | A23 | 10.76.16.1 | 255.255.255.224 |
| Phantoma | A24 | 10.76.16.89 | 255.255.255.252 |
| Shibuya | A24 | 10.76.16.90 | 255.255.255.252 |
| Shibuya | A25 | 10.76.15.1 | 255.255.255.192 |

Alamat IP pada tabel tersebut merupakan alamat interface router yang digunakan sebagai gateway jaringan lokal maupun alamat pada koneksi antarrouter.

## 3.3 Konfigurasi Alamat IP pada End Device

Setelah konfigurasi interface router dilakukan, tahap berikutnya adalah memberikan alamat IP pada setiap end device.

Pengaturan dilakukan melalui menu:

**Desktop → IP Configuration → Static**

Setiap perangkat diberikan IP Address, Subnet Mask, dan Default Gateway sesuai subnet masing-masing.

Berikut tabel pengalamatan end device:

| Subnet | Perangkat | IP Address | Subnet Mask | Default Gateway |
|---|---|---|---|---|
| A1 | JJ | 10.76.14.2 | 255.255.255.128 | 10.76.14.1 |
| A1 | MyuMyu | 10.76.14.3 | 255.255.255.128 | 10.76.14.1 |
| A4 | Karl | 10.76.0.2 | 255.255.252.0 | 10.76.0.1 |
| A4 | Lin | 10.76.0.3 | 255.255.252.0 | 10.76.0.1 |
| A5 | Masayuki | 10.76.8.2 | 255.255.254.0 | 10.76.8.1 |
| A6 | Juri | 10.76.15.194 | 255.255.255.192 | 10.76.15.193 |
| A7 | Akashic | 10.76.16.42 | 255.255.255.248 | 10.76.16.41 |
| A9 | Omnipresence | 10.76.4.2 | 255.255.252.0 | 10.76.4.1 |
| A9 | Denpa | 10.76.4.3 | 255.255.252.0 | 10.76.4.1 |
| A11 | Alice | 10.76.12.2 | 255.255.255.0 | 10.76.12.1 |
| A11 | Reika | 10.76.12.3 | 255.255.255.0 | 10.76.12.1 |
| A12 | Taro | 10.76.15.66 | 255.255.255.192 | 10.76.15.65 |
| A13 | Yasuo | 10.76.13.2 | 255.255.255.0 | 10.76.13.1 |
| A13 | Miho | 10.76.13.3 | 255.255.255.0 | 10.76.13.1 |
| A13 | Kuma | 10.76.13.4 | 255.255.255.0 | 10.76.13.1 |
| A15 | Collective | 10.76.10.2 | 255.255.254.0 | 10.76.10.1 |
| A15 | Ghost | 10.76.10.3 | 255.255.254.0 | 10.76.10.1 |
| A17 | Lilith | 10.76.14.130 | 255.255.255.128 | 10.76.14.129 |
| A17 | Specter | 10.76.14.131 | 255.255.255.128 | 10.76.14.129 |
| A19 | Chisa | 10.76.15.130 | 255.255.255.192 | 10.76.15.129 |
| A19 | Hodgeson | 10.76.15.131 | 255.255.255.192 | 10.76.15.129 |
| A21 | Eiri | 10.76.16.50 | 255.255.255.248 | 10.76.16.49 |
| A23 | Semi | 10.76.16.2 | 255.255.255.224 | 10.76.16.1 |
| A25 | Lain | 10.76.15.2 | 255.255.255.192 | 10.76.15.1 |
| A25 | Mika | 10.76.15.3 | 255.255.255.192 | 10.76.15.1 |

Pengaturan alamat IP dilakukan secara manual agar setiap perangkat berada pada subnet yang sesuai dan dapat berkomunikasi melalui gateway masing-masing.

## 3.4 Konfigurasi Routing OSPF

Setelah seluruh interface router dan end device mendapatkan alamat IP, tahap berikutnya adalah mengatur routing agar jaringan yang berbeda dapat saling berkomunikasi.

Pada praktikum ini digunakan protokol **Open Shortest Path First (OSPF)** dengan process ID 1 dan area 0.

OSPF merupakan protokol routing dinamis yang memungkinkan router saling bertukar informasi jaringan dan menentukan jalur terbaik untuk meneruskan paket data.

Konfigurasi OSPF dilakukan melalui CLI setiap router menggunakan perintah:

```cisco
enable
configure terminal
router ospf 1
network ALAMAT_IP 0.0.0.0 area 0
```

Wildcard mask `0.0.0.0` digunakan untuk mencocokkan satu alamat interface secara spesifik.

Berikut konfigurasi OSPF pada masing-masing router.

### A. Router Cyberia

```cisco
router ospf 1
network 10.76.14.1 0.0.0.0 area 0
network 10.76.16.57 0.0.0.0 area 0
```

### B. Router Wired

```cisco
router ospf 1
network 10.76.16.58 0.0.0.0 area 0
network 10.76.16.33 0.0.0.0 area 0
network 10.76.16.65 0.0.0.0 area 0
network 10.76.16.69 0.0.0.0 area 0
```

### C. Router Psyche

```cisco
router ospf 1
network 10.76.16.34 0.0.0.0 area 0
network 10.76.0.1 0.0.0.0 area 0
```

### D. Router Copland

```cisco
router ospf 1
network 10.76.16.35 0.0.0.0 area 0
network 10.76.8.1 0.0.0.0 area 0
network 10.76.15.193 0.0.0.0 area 0
```

### E. Router Schumann

```cisco
router ospf 1
network 10.76.16.36 0.0.0.0 area 0
network 10.76.16.41 0.0.0.0 area 0
network 10.76.16.61 0.0.0.0 area 0
```

### F. Router Accela

```cisco
router ospf 1
network 10.76.16.62 0.0.0.0 area 0
network 10.76.4.1 0.0.0.0 area 0
```

### G. Router Navi

```cisco
router ospf 1
network 10.76.16.66 0.0.0.0 area 0
network 10.76.12.1 0.0.0.0 area 0
network 10.76.15.65 0.0.0.0 area 0
network 10.76.13.1 0.0.0.0 area 0
```

### H. Router Tachibana

```cisco
router ospf 1
network 10.76.16.70 0.0.0.0 area 0
network 10.76.10.1 0.0.0.0 area 0
network 10.76.16.73 0.0.0.0 area 0
```

### I. Router Deus

```cisco
router ospf 1
network 10.76.16.74 0.0.0.0 area 0
network 10.76.14.129 0.0.0.0 area 0
network 10.76.16.77 0.0.0.0 area 0
```

### J. Router Protocol7

```cisco
router ospf 1
network 10.76.16.78 0.0.0.0 area 0
network 10.76.15.129 0.0.0.0 area 0
network 10.76.16.81 0.0.0.0 area 0
```

### K. Router Knights

```cisco
router ospf 1
network 10.76.16.82 0.0.0.0 area 0
network 10.76.16.49 0.0.0.0 area 0
network 10.76.16.85 0.0.0.0 area 0
```

### L. Router Phantoma

```cisco
router ospf 1
network 10.76.16.86 0.0.0.0 area 0
network 10.76.16.1 0.0.0.0 area 0
network 10.76.16.89 0.0.0.0 area 0
```

### M. Router Shibuya

```cisco
router ospf 1
network 10.76.16.90 0.0.0.0 area 0
network 10.76.15.1 0.0.0.0 area 0
```

Setelah konfigurasi selesai, setiap router menyimpan konfigurasi menggunakan perintah:

```cisco
end
copy running-config startup-config
```

Perintah tersebut digunakan untuk menyimpan konfigurasi aktif agar tetap tersedia ketika perangkat dinyalakan kembali.

## 3.5 Pemeriksaan Routing OSPF

Setelah konfigurasi OSPF diterapkan pada seluruh router, dilakukan pemeriksaan untuk memastikan router telah bertukar informasi routing.

Pemeriksaan dilakukan menggunakan perintah berikut:

```cisco
show ip ospf neighbor
```

Perintah tersebut menampilkan informasi router tetangga yang terhubung melalui OSPF.

Status `FULL` menunjukkan bahwa proses pertukaran informasi routing antara router telah selesai. Pada jaringan broadcast, status `2WAY` juga dapat muncul di antara router yang sama-sama berstatus DROTHER dan bukan selalu menunjukkan kesalahan konfigurasi.

Selain itu, pemeriksaan tabel routing dilakukan menggunakan perintah:

```cisco
show ip route
```

Pada tabel routing, terdapat beberapa kode yang digunakan untuk menunjukkan sumber informasi jaringan:

| Kode | Keterangan |
|---|---|
| C | Connected, jaringan terhubung langsung. |
| L | Local, alamat IP interface router itu sendiri. |
| O | OSPF, jaringan dipelajari melalui protokol OSPF. |

Berdasarkan hasil pemeriksaan pada router Cyberia, jaringan internal telah berhasil dipelajari melalui OSPF.

Contoh hasil tabel routing yang diperoleh pada Cyberia:

```text
O 10.76.0.0/22 via 10.76.16.58
O 10.76.4.0/22 via 10.76.16.58
O 10.76.8.0/23 via 10.76.16.58
O 10.76.10.0/23 via 10.76.16.58
O 10.76.12.0/24 via 10.76.16.58
O 10.76.13.0/24 via 10.76.16.58
C 10.76.14.0/25 is directly connected
O 10.76.14.128/25 via 10.76.16.58
O 10.76.15.0/26 via 10.76.16.58
O 10.76.15.64/26 via 10.76.16.58
O 10.76.15.128/26 via 10.76.16.58
O 10.76.15.192/26 via 10.76.16.58
O 10.76.16.0/27 via 10.76.16.58
O 10.76.16.32/29 via 10.76.16.58
O 10.76.16.40/29 via 10.76.16.58
O 10.76.16.48/29 via 10.76.16.58
C 10.76.16.56/30 is directly connected
O 10.76.16.60/30 via 10.76.16.58
O 10.76.16.64/30 via 10.76.16.58
O 10.76.16.68/30 via 10.76.16.58
O 10.76.16.72/30 via 10.76.16.58
O 10.76.16.76/30 via 10.76.16.58
O 10.76.16.80/30 via 10.76.16.58
O 10.76.16.84/30 via 10.76.16.58
O 10.76.16.88/30 via 10.76.16.58
```

Keterangan:
- Jaringan A1 dan A2 ditampilkan sebagai connected karena terhubung langsung ke Cyberia.
- Jaringan lainnya dipelajari melalui OSPF.
- Alamat `10.76.16.58` merupakan next hop menuju router Wired.
- Seluruh jaringan internal yang dialokasikan pada tabel VLSM telah muncul dalam tabel routing Cyberia.

Hasil tersebut menunjukkan bahwa informasi jaringan internal telah tersebar melalui routing OSPF.

## 3.6 Pengujian Konektivitas Jaringan

Setelah konfigurasi IP dan routing selesai, dilakukan pengujian untuk memastikan perangkat dapat saling berkomunikasi.

Pengujian dilakukan menggunakan perintah `ping` melalui Command Prompt pada end device.

Pengujian pertama dilakukan dari PC JJ menuju perangkat Karl yang berada pada subnet berbeda.

Alamat tujuan:

- IP PC JJ: 10.76.14.2
- IP Server Karl: 10.76.0.2

Perintah yang digunakan:

```cmd
ping 10.76.0.2
```

Hasil pengujian:

```text
C:\>ping 10.76.0.2

Pinging 10.76.0.2 with 32 bytes of data:

Reply from 10.76.0.2: bytes=32 time<1ms TTL=125
Reply from 10.76.0.2: bytes=32 time<1ms TTL=125
Reply from 10.76.0.2: bytes=32 time<1ms TTL=125
Reply from 10.76.0.2: bytes=32 time<1ms TTL=125

Ping statistics for 10.76.0.2:

Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),

Approximate round trip times in milli-seconds:

Minimum = 0ms, Maximum = 0ms, Average = 0ms
```

Berdasarkan hasil pengujian, seluruh paket berhasil dikirim dan diterima tanpa kehilangan paket. Hal ini menunjukkan bahwa PC JJ dapat berkomunikasi dengan perangkat Karl meskipun berada pada subnet yang berbeda.

Pengujian ini membuktikan bahwa konfigurasi alamat IP, default gateway, dan routing antarjaringan telah berjalan untuk jalur komunikasi yang diuji.

## 3.7 Konfigurasi dan Status Koneksi Cloud

Sesuai ketentuan soal, router Cyberia merupakan satu-satunya router yang terhubung ke NAT/Cloud. Oleh karena itu, Cloud-PT ditempatkan pada topologi dan dihubungkan ke interface FastEthernet0/0 pada router Cyberia melalui port Ethernet6 pada Cloud-PT.

Pada tahap konfigurasi, dilakukan pemeriksaan terhadap port Cloud-PT melalui menu Config. Port Ethernet6 tersedia, tetapi status koneksinya masih menunjukkan `Down`.

Pemetaan koneksi melalui menu Cable juga telah dicoba. Namun, pemetaan tersebut belum berhasil mengaktifkan koneksi antara Cloud-PT dan Cyberia.

Dengan demikian, koneksi internal melalui OSPF telah berhasil diuji, sedangkan koneksi eksternal melalui Cloud/NAT belum dapat dinyatakan berhasil. Pengujian akses ke jaringan eksternal belum menjadi hasil yang dapat dilaporkan pada tahap ini.

## 3.8 Dokumentasi Hasil Praktikum

Dokumentasi dilakukan sebagai bukti proses pengerjaan dan hasil implementasi jaringan pada Cisco Packet Tracer.

Dokumentasi yang perlu dilampirkan dalam laporan meliputi:

| No. | Dokumentasi | Keterangan |
|---|---|---|
| 1 | Tabel perhitungan VLSM | Menunjukkan pembagian subnet berdasarkan kebutuhan host. |
| 2 | Topologi jaringan keseluruhan | Menunjukkan seluruh router, switch, end device, dan Cloud-PT. |
| 3 | Konfigurasi interface router | Menunjukkan alamat IP dan subnet mask pada interface router. |
| 4 | Konfigurasi IP end device | Menunjukkan IP Address, Subnet Mask, dan Default Gateway. |
| 5 | Hasil `show ip ospf neighbor` | Menunjukkan hubungan adjacency antarrouter. |
| 6 | Hasil `show ip route` | Menunjukkan jaringan yang dipelajari melalui OSPF. |
| 7 | Hasil ping JJ menuju Karl | Menunjukkan keberhasilan komunikasi antar-subnet. |
| 8 | Tampilan koneksi Cloud-PT | Menunjukkan proses koneksi Cyberia ke Cloud-PT. |

Setiap dokumentasi diberi keterangan gambar agar hasil praktikum lebih mudah dipahami.

## 3.9 Analisis Hasil Praktikum

Berdasarkan proses perancangan dan konfigurasi yang telah dilakukan, jaringan berhasil dibangun menggunakan metode VLSM dengan blok alamat 10.76.0.0/19.

Pembagian alamat IP menghasilkan 25 subnet dengan prefix yang berbeda sesuai kebutuhan host. Setiap router diberikan alamat IP pada interface yang terhubung dengan subnet terkait, sedangkan end device diberikan alamat IP dan default gateway sesuai jaringan masing-masing.

Penggunaan OSPF memungkinkan router saling bertukar informasi routing sehingga jaringan yang berbeda dapat saling berkomunikasi. Hal tersebut dibuktikan melalui tabel routing pada Cyberia yang telah menampilkan jaringan internal sebagai connected maupun jaringan yang dipelajari melalui OSPF.

Pengujian ping dari PC JJ menuju Karl juga berhasil dengan empat paket diterima dan tidak terdapat packet loss. Hasil ini menunjukkan bahwa komunikasi antar-subnet telah berjalan pada jalur yang diuji.

Sementara itu, koneksi Cyberia menuju Cloud-PT belum berhasil diaktifkan. Oleh karena itu, pengujian komunikasi ke jaringan eksternal belum dapat dilakukan dan tidak dimasukkan sebagai keberhasilan praktikum.

## 3.10 Kesimpulan

Berdasarkan praktikum yang telah dilakukan, dapat disimpulkan bahwa metode VLSM dapat digunakan untuk membagi satu blok alamat IP menjadi beberapa subnet dengan kapasitas yang disesuaikan terhadap kebutuhan host pada setiap jaringan.

Hasil pembagian subnet kemudian diterapkan pada topologi menggunakan Cisco Packet Tracer dengan 13 router, switch, dan berbagai end device. Konfigurasi alamat IP dilakukan pada interface router dan perangkat akhir sesuai hasil perhitungan.

Protokol OSPF digunakan untuk mendistribusikan informasi routing antarrouter. Berdasarkan pemeriksaan tabel routing dan pengujian ping dari JJ menuju Karl, komunikasi antarjaringan internal berhasil dilakukan tanpa packet loss.

Dengan demikian, implementasi subnetting VLSM dan routing OSPF pada jaringan internal telah berhasil dilakukan. Adapun koneksi menuju Cloud/NAT masih memerlukan konfigurasi dan pengujian lanjutan.