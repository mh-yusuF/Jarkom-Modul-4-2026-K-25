# Jarkom-Modul-4-2026-K-25

## Anggota
| Nama | NRP | 
|---|---|
| Muhammad Yusuf | 5027251067 |
| Azhari Rahma Putri | 5027251114 |

## Laporan
# Pembuktian Pengujian Jaringan Modul 4 (GNS3 - CIDR)

Laporan ini berisi rincian topologi jaringan serta pembuktian pengujian konektivitas (*ping*) antar-subnet dari node **Kari** ke berbagai entitas di seluruh jaringan **The Wired** menggunakan metode pengalokasian IP **CIDR (Classless Inter-Domain Routing)**.

---

## 1. Topologi Jaringan (`1_topologi.png`)

![Topologi Jaringan GNS3](assets/1_topologi.png)

### Penjelasan Topologi:
* Jaringan **The Wired** terhubung ke internet/dunia luar secara terpusat melalui **Router Cyberia** yang tersambung ke node **NAT1**.
* Router **Wired** bertindak sebagai hub utama yang membagi jalur ke beberapa cabang besar:
  1. **Cabang Utama 1 (Kiri):** Melalui Router **Psyche**, **Copland**, dan **Schumann**. Node **Kari** berada pada Subnet Switch3 di bawah hirarki Router Psyche.
  2. **Cabang Utama 2 (Kanan):** Melalui Router **Navi** menuju entitas seperti Alice, Reika, Kuma, Yaeyo, Miho, dll.
  3. **Cabang Utama 3 (Bawah):** Melalui Router **Tachibana** yang bercabang ke Deus, Protocol7, Knights, Phantoma, hingga kawasan Shibuya (Lain & Mika).
* Seluruh alamat IP dikelompokkan dan dihitung secara hierarkis menggunakan **CIDR** untuk memastikan tidak ada alokasi IP yang terbuang (*efficient IP allocation*) serta tabel routing terkonfigurasi dengan efisien tanpa ada node yang terisolasi.

---

## 2. Inisialisasi & Pengujian Subnet Lokal Kari - Lin (`Kari-lin.png`)

![Konfigurasi dan Ping Kari ke Lin](assets/Kari-lin.png)

### Alur & Analisis:
1. **Inisialisasi Node:** Script `/root/kari.sh` dijalankan pada node **Kari** untuk menerapkan konfigurasi IP address dan tabel routing otomatis.
2. **Pengecekan Alokasi IP (CIDR):** 
   * Interface `eth0` mendapatkan IP `10.76.0.2/22` (Subnet Mask `255.255.252.0`). 
   * Blok CIDR `/22` ini memuat subnet lokal tempat **Kari** dan **Lin** berada.
3. **Pengecekan Gateway & Routing:** 
   * Memiliki default gateway ke `10.76.0.1 dev eth0` serta rute *directly connected* untuk subnet `10.76.0.0/22`.
4. **Pengujian Ping (`Kari -> Lin`):**
   * Command: `ping -c 2 10.76.0.3`
   * Target **Lin** berada pada subnet lokal yang sama (`10.76.0.3`).
   * **Hasil:** 2 paket terkirim dan diterima (0% packet loss), dengan `ttl=64` (default Linux TTL untuk satu segmen jaringan lokal tanpa melewati router/hop tambahan).

---

## 3. Pengujian Lintas Subnet: Kari ke Juri (`kari-juri.png`)

![Ping Kari ke Juri](assets/kari-juri.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Copland` $\rightarrow$ `Switch4` $\rightarrow$ `Juri (10.76.6.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.6.2`
* **Hasil:** 0% packet loss, RTT rata-rata `1.834 ms`.
* **Analisis TTL:** Nilai `ttl=61` berkurang dari 64 karena paket data melompati 3 *router* perantara (`Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Copland`), membuktikan rute antarnode pada segmen Copland terhubung dengan benar.

---

## 4. Pengujian Lintas Subnet: Kari ke Akashic (`kari-akashic.png`)

![Ping Kari ke Akashic](assets/kari-akashic.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Schumann` $\rightarrow$ `Akashic (10.76.12.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.12.2`
* **Hasil:** 0% packet loss, RTT rata-rata `1.517 ms`.
* **Analisis TTL:** Nilai `ttl=61` menunjukkan paket berhasil melewati router perantara di cabang Schumann tanpa hambatan routing.

---

## 5. Pengujian Lintas Subnet: Kari ke Denpa (`kari-denpa.png`)

![Ping Kari ke Denpa](assets/kari-denpa.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Schumann` $\rightarrow$ `Accela` $\rightarrow$ `Switch5` $\rightarrow$ `Denpa (10.76.8.3)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.8.3`
* **Hasil:** 0% packet loss, RTT rata-rata `1.656 ms`.
* **Analisis TTL:** Nilai `ttl=60` berkurang 4 hop dari standar awal (64), menandakan paket melewati hirarki router yang lebih dalam (`Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Schumann` $\rightarrow$ `Accela`) hingga mencapai segmen Switch5.

---

## 6. Pengujian Lintas Subnet: Kari ke Ghost (`kari-ghost.png`)

![Ping Kari ke Ghost](assets/kari-ghost.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Wired` $\rightarrow$ `Tachibana` $\rightarrow$ `Switch9` $\rightarrow$ `Ghost (10.76.24.3)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.24.3`
* **Hasil:** 0% packet loss, RTT rata-rata `1.686 ms`.
* **Analisis TTL:** Nilai `ttl=61` membuktikan paket sukses melintasi core router jaringan **Wired** dan berpindah dari segmen Psyche menuju segmen Tachibana/Switch9.

---

## 7. Pengujian Lapisan Dalam: Kari ke Semi (`kari-semi.png`)

![Ping Kari ke Semi](assets/kari-semi.png)

### Alur Perjalanan Paket (Routing Path):
`Kari` $\rightarrow$ `Psyche` $\rightarrow$ `Wired` $\rightarrow$ `Tachibana` $\rightarrow$ `Deus` $\rightarrow$ `Protocol7` $\rightarrow$ `Knights` $\rightarrow$ `Phantoma` $\rightarrow$ `Switch12` $\rightarrow$ `Semi (10.76.28.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.28.2`
* **Hasil:** 0% packet loss, RTT rata-rata `2.340 ms`.
* **Analisis TTL:** Nilai `ttl=57` adalah yang paling kecil dibanding pengujian lainnya. Ini dikarenakan node **Semi** terletak sangat jauh di lapisan terdalam topologi *The Wired*. Paket harus melompati 7 router (`Psyche` $\rightarrow$ `Wired` $\rightarrow$ `Tachibana` $\rightarrow$ `Deus` $\rightarrow$ `Protocol7` $\rightarrow$ `Knights` $\rightarrow$ `Phantoma`), sehingga TTL berkurang dari 64 menjadi 57 ($64 - 7 = 57$).

---

## 8. Pengujian Cabang Navi: Kari ke Alice (`kari-alice.png`)

![Ping Kari ke Alice](assets/kari-alice.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Wired` $\rightarrow$ `Navi` $\rightarrow$ `Switch6` $\rightarrow$ `Alice (10.76.18.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.18.2`
* **Hasil:** 0% packet loss, RTT rata-rata `1.509 ms`.
* **Analisis TTL:** Nilai `ttl=61` membuktikan bahwa keterhubungan antara cabang kiri (Psyche) dan cabang kanan (Navi) melalui router hub **Wired** telah ter-routing secara optimal.

---

## Kesimpulan Pembuktian
Berdasarkan seluruh hasil pengujian *ping* dari node **Kari**:
1. **Konektivitas 100%:** Seluruh paket uji (ICMP) mencapai target tanpa *packet loss* (0% loss) baik pada subnet lokal maupun antar-subnet beda cabang.
2. **Routing Efisien:** Nilai TTL yang berkurang secara konsisten sesuai dengan jumlah hop router yang dilewati membuktikan tidak adanya *routing loop* dan tabel routing statis/CIDR telah dikonfigurasi dengan tepat.
3. **Persyaratan Modul Terpenuhi:** Seluruh node dalam topologi terhubung penuh (*full reachability*) sesuai aturan praktikum.

# Dokumentasi Perhitungan Subnetting CIDR & VLSM (The Wired - Modul 4)

Dokumen ini memuat rincian kalkulasi pembagian IP address (VLSM), pengalokasian host & interface router, serta tahap penggabungan subnet secara hirarkis (Supernetting CIDR Level I–VIII) untuk topologi jaringan **The Wired**.

---

## 1. Pendahuluan & Prinsip Dasar Perhitungan

Sesuai dengan ketentuan praktikum:
1. **Perhitungan IP per Subnet:** 
   $$\text{Jumlah IP Dibutuhkan} = \text{Jumlah Host} + \text{Jumlah Interface Router pada Subnet Tersebut}$$
2. **Penentuan Prefix/Netmask (VLSM):** Mencari pangkat dua terkecil ($2^n$) yang dapat menampung total IP yang dibutuhkan, dengan rentang usable host: $(2^n - 2)$.
3. **Prefix Utama Jaringan:** `10.76.0.0/19` (Kapasitas Total 8.192 IP, Netmask `255.255.224.0`).

---

## 2. Tabel Alokasi IP & Subnetting CIDR (`Pembagian IP - CIDR`)

Setiap subnet dihitung berdasarkan urutan kebutuhan terbesar ke terpencil untuk efisiensi ruang pengalamatan:

| Sayap | Subnet | Kebutuhan Host / Detail Entitas | CIDR | Network ID | Broadcast | Usable Range IP |
| :--- | :--- | :--- | :---: | :--- | :--- | :--- |
| **Kiri** | **A4** | Karl, Lin ($700 + 180 = 880$ host $+ 1$ router) | `/22` | `10.76.0.0` | `10.76.3.255` | `10.76.0.1 - 10.76.3.254` |
| | **A5** | Masayuki ($300$ host $+ 1$ router) | `/23` | `10.76.4.0` | `10.76.5.255` | `10.76.4.1 - 10.76.5.254` |
| | **A6** | Juri ($31$ host $+ 1$ router) | `/26` | `10.76.6.0` | `10.76.6.63` | `10.76.6.1 - 10.76.6.62` |
| | **A9** | Omnipresence, Denpa ($219 + 5 host + 1$ router) | `/22` | `10.76.8.0` | `10.76.11.255` | `10.76.8.1 - 10.76.11.254` |
| | **A7** | Schumann > Akashic ($3$ host $+ 1$ router) | `/29` | `10.76.12.0` | `10.76.12.7` | `10.76.12.1 - 10.76.12.6` |
| | **A8** | Schumann > Accela ($2$ interface router) | `/30` | `10.76.12.8` | `10.76.12.11` | `10.76.12.9 - 10.76.12.10` |
| **Kanan** | **A13** | Yasuo, Miho, Kuma ($128 + 10 + 4 = 142$ host $+ 1$ router) | `/24` | `10.76.16.0` | `10.76.16.255` | `10.76.16.1 - 10.76.16.254` |
| | **A12** | Navi > Switch3 > Taro ($57$ host $+ 1$ router) | `/26` | `10.76.17.0` | `10.76.17.63` | `10.76.17.1 - 10.76.17.62` |
| | **A11** | Alice, Reika ($700 + 200 \rightarrow$ penyesuaian $254$ IP) | `/24` | `10.76.18.0` | `10.76.18.255` | `10.76.18.1 - 10.76.18.254` |
| | **A1** | Cyberia > Switch1 > JJ, MyuMyu ($126$ host $+ 1$ router) | `/25` | `10.76.20.0` | `10.76.20.127` | `10.76.20.1 - 10.76.20.126` |
| | **B6** | Cyberia/Wired/Navi PTP Inter-router | `/29` | `10.76.20.128` | `10.76.20.135` | `10.76.20.129 - 10.76.20.134` |
| | **A3** | Wired > Switch2 Inter-router | `/29` | `10.76.20.136` | `10.76.20.143` | `10.76.20.137 - 10.76.20.142` |
| | **A2** | Cyberia > Wired Inter-router | `/30` | `10.76.20.144` | `10.76.20.147` | `10.76.20.145 - 10.76.20.146` |
| **Bawah** | **A15** | Tachibana > Switch9 > Collective, Ghost ($260$ host $+ 1$ router) | `/23` | `10.76.24.0` | `10.76.25.255` | `10.76.24.1 - 10.76.25.254` |
| | **A16** | Tachibana > Deus ($2$ interface router) | `/30` | `10.76.26.0` | `10.76.26.3` | `10.76.26.1 - 10.76.26.2` |
| | **A23** | Phantoma > Switch12 > Semi ($14$ host $+ 1$ router) | `/27` | `10.76.28.0` | `10.76.28.31` | `10.76.28.1 - 10.76.28.30` |
| | **A24** | Phantoma > Shibuya ($2$ interface router) | `/30` | `10.76.28.32` | `10.76.28.35` | `10.76.28.33 - 10.76.28.34` |
| | **A25** | Shibuya > Switch13 > Lain, Mika ($57 + 4$ host $+ 1$ router) | `/26` | `10.76.28.64` | `10.76.28.127` | `10.76.28.65 - 10.76.28.126` |
| | **A21** | Knights > Eiri ($2$ host $+ 1$ router) | `/29` | `10.76.28.128` | `10.76.28.135` | `10.76.28.129 - 10.76.28.134` |
| | **A22** | Knights > Phantoma ($2$ interface router) | `/30` | `10.76.28.136` | `10.76.28.139` | `10.76.28.137 - 10.76.28.138` |
| | **A19** | Protocol7 > Switch11 > Chisa, Hodgeson ($23 + 9$ host $+ 1$ router) | `/26` | `10.76.29.0` | `10.76.29.63` | `10.76.29.1 - 10.76.29.62` |
| | **A20** | Protocol7 > Knights ($2$ interface router) | `/30` | `10.76.29.64` | `10.76.29.67` | `10.76.29.65 - 10.76.29.66` |
| | **A17** | Deus > Switch10 > Lilith, Specter ($77 + 21$ host $+ 1$ router) | `/25` | `10.76.30.0` | `10.76.30.127` | `10.76.30.1 - 10.76.30.126` |
| | **A18** | Deus > Protocol7 ($2$ interface router) | `/30` | `10.76.30.128` | `10.76.30.131` | `10.76.30.129 - 10.76.30.130` |

---

## 3. Tahap Penggabungan CIDR Berjenjang (Level I – VIII)

Proses **CIDR Aggregation (Route Summarization)** dilakukan secara bertahap dari daun pohon topologi (*leaf nodes*) menuju router pusat **Wired/Cyberia**:

### Level I: Penggabungan Subnet Terluar (`level_1_I.png`)
![Level 1 - Hasil Penggabungan](assets/level_1_I.png)

Menggabungkan subnet point-to-point kecil dan subnet daun terdekat:
* **B1** (`/26`): Gabungan `A23 (/27)` + `A24 (/30)` $\rightarrow$ `10.76.28.0/26`
* **B2** (`/28`): Gabungan `A21 (/29)` + `A22 (/30)` $\rightarrow$ `10.76.28.128/28`
* **B3** (`/25`): Gabungan `A19 (/26)` + `A20 (/30)` $\rightarrow$ `10.76.29.0/25`
* **B4** (`/24`): Gabungan `A17 (/25)` + `A18 (/30)` $\rightarrow$ `10.76.30.0/24`
* **B5** (`/22`): Gabungan `A15 (/23)` + `A16 (/30)` $\rightarrow$ `10.76.24.0/22`
* **B6** (`/29`): Gabungan Inter-router `A10 (/30)` + `A14 (/30)` $\rightarrow$ `10.76.20.128/29`
* **B7** (`/22`): Gabungan `A5 (/23)` + `A6 (/26)` $\rightarrow$ `10.76.4.0/22`
* **B8** (`/28`): Gabungan `A7 (/29)` + `A8 (/30)` $\rightarrow$ `10.76.12.0/28`
* **B9** (`/23`): Gabungan `A13 (/24)` + `A12 (/26)` $\rightarrow$ `10.76.16.0/23`

---

### Level II: Aggregation Cabang Utama (`level_2_II.png`)
![Level 2 - Hasil Penggabungan](assets/level_2_II.png)

* **C1** (`/25`): Gabungan `B1 (/26)` + `A25 (/26)` (Kawasan Shibuya & Phantoma) $\rightarrow$ `10.76.28.0/25`
* **C2** (`/28`): Gabungan `B6 (/29)` + `A3 (/29)` (Jalur Core Inter-router) $\rightarrow$ `10.76.20.128/28`
* **C3** (`/21`): Gabungan `A9 (/22)` + `B8 (/28)` (Cabang Schumann/Accela) $\rightarrow$ `10.76.8.0/21`
* **C4** (`/22`): Gabungan `B9 (/23)` + `A11 (/24)` (Cabang Navi Utama) $\rightarrow$ `10.76.16.0/22`
* **C5** (`/21`): Gabungan `A4 (/22)` + `B7 (/22)` (Cabang Psyche & Copland) $\rightarrow$ `10.76.0.0/21`

---

### Level III: Summarization Wilayah Barat & Timur (`level_3_III.png`)
![Level 3 - Hasil Penggabungan](assets/level_3_III.png)

* **D1** (`/24`): Gabungan `C1 (/25)` + `B2 (/28)` (Kawasan Knights & Phantoma) $\rightarrow$ `10.76.28.0/24`
* **D2** (`/27`): Gabungan `C2 (/28)` + `A2 (/30)` (Jalur Cyberia-Wired) $\rightarrow$ `10.76.20.128/27`
* **D3** (`/20`): Gabungan `C5 (/21)` + `C3 (/21)` (Seluruh Sayap Kiri: Psyche, Copland, Schumann) $\rightarrow$ `10.76.0.0/20`

---

### Level IV: Consolidation Cabang Protocol & Cyberia (`level_4_IV.png`)
![Level 4 - Hasil Penggabungan](assets/level_4_IV.png)

* **E1** (`/23`): Gabungan `D1 (/24)` + `B3 (/25)` (Wilayah Protocol7 & Knights) $\rightarrow$ `10.76.28.0/23`
* **E2** (`/24`): Gabungan `A1 (/25)` + `D2 (/27)` (Kawasan Cyberia & Gateway Utama) $\rightarrow$ `10.76.20.0/24`

---

### Level V: Consolidation Deus & Core Navi (`level_5_V.png`)
![Level 5 - Hasil Penggabungan](assets/level_5_V.png)

* **F1** (`/22`): Gabungan `E1 (/23)` + `B4 (/24)` (Seluruh Sektor Deus & Protocol7) $\rightarrow$ `10.76.28.0/22`
* **F2** (`/21`): Gabungan `C4 (/22)` + `E2 (/24)` (Seluruh Cabang Atas & Navi) $\rightarrow$ `10.76.16.0/21`

---

### Level VI: Aggregate Sektor Tachibana Bawah (`level_6_VI.png`)
![Level 6 - Hasil Penggabungan](assets/level_6_VI.png)

* **G1** (`/21`): Gabungan `B5 (/22)` + `F1 (/22)` (Seluruh Kawasan Bawah Tachibana) $\rightarrow$ `10.76.24.0/21`

---

### Level VII: Merging Seluruh Sayap Kanan & Bawah (`level_7_VII.png`)
![Level 7 - Hasil Penggabungan](assets/level_7_VII.png)

* **H1** (`/20`): Gabungan `F2 (/21)` + `G1 (/21)` (Seluruh Kawasan Timur & Selatan The Wired) $\rightarrow$ `10.76.16.0/20`

---

### Level VIII: Root Summarization Total (`level_8_VIII.png`)
![Level 8 - Hasil Penggabungan](assets/level_8_VIII.png)

* **I1** (`/19`): Gabungan `D3 (/20)` (Sayap Kiri) + `H1 (/20)` (Sayap Kanan & Bawah) $\rightarrow$ **`10.76.0.0/19`**

---

## 4. Kesimpulan Hasil Akhir

1. **Hasil Akhir Supernetting (`I1`):** `10.76.0.0/19` melingkupi seluruh 25 subnet dari `A1` hingga `A25` tanpa ada blok IP yang terputus atau tumpang tindih (*zero IP space collision*).
2. **Efisiensi Routing Table:** Dengan hirarki supernetting hingga 8 level ini, router utama **Wired** dan **Cyberia** hanya memerlukan tabel routing ringkas berbasis supernet untuk meneruskan paket data ke seluruh cabang topologi *The Wired*.
