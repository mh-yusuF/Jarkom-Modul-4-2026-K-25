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

![Topologi Jaringan GNS3](1_topologi.png)

### Penjelasan Topologi:
* Jaringan **The Wired** terhubung ke internet/dunia luar secara terpusat melalui **Router Cyberia** yang tersambung ke node **NAT1**.
* Router **Wired** bertindak sebagai hub utama yang membagi jalur ke beberapa cabang besar:
  1. **Cabang Utama 1 (Kiri):** Melalui Router **Psyche**, **Copland**, dan **Schumann**. Node **Kari** berada pada Subnet Switch3 di bawah hirarki Router Psyche.
  2. **Cabang Utama 2 (Kanan):** Melalui Router **Navi** menuju entitas seperti Alice, Reika, Kuma, Yaeyo, Miho, dll.
  3. **Cabang Utama 3 (Bawah):** Melalui Router **Tachibana** yang bercabang ke Deus, Protocol7, Knights, Phantoma, hingga kawasan Shibuya (Lain & Mika).
* Seluruh alamat IP dikelompokkan dan dihitung secara hierarkis menggunakan **CIDR** untuk memastikan tidak ada alokasi IP yang terbuang (*efficient IP allocation*) serta tabel routing terkonfigurasi dengan efisien tanpa ada node yang terisolasi.

---

## 2. Inisialisasi & Pengujian Subnet Lokal Kari - Lin (`Kari-lin.png`)

![Konfigurasi dan Ping Kari ke Lin](Kari-lin.png)

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

![Ping Kari ke Juri](kari-juri.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Copland` $\rightarrow$ `Switch4` $\rightarrow$ `Juri (10.76.6.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.6.2`
* **Hasil:** 0% packet loss, RTT rata-rata `1.834 ms`.
* **Analisis TTL:** Nilai `ttl=61` berkurang dari 64 karena paket data melompati 3 *router* perantara (`Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Copland`), membuktikan rute antarnode pada segmen Copland terhubung dengan benar.

---

## 4. Pengujian Lintas Subnet: Kari ke Akashic (`kari-akashic.png`)

![Ping Kari ke Akashic](kari-akashic.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Schumann` $\rightarrow$ `Akashic (10.76.12.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.12.2`
* **Hasil:** 0% packet loss, RTT rata-rata `1.517 ms`.
* **Analisis TTL:** Nilai `ttl=61` menunjukkan paket berhasil melewati router perantara di cabang Schumann tanpa hambatan routing.

---

## 5. Pengujian Lintas Subnet: Kari ke Denpa (`kari-denpa.png`)

![Ping Kari ke Denpa](kari-denpa.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Schumann` $\rightarrow$ `Accela` $\rightarrow$ `Switch5` $\rightarrow$ `Denpa (10.76.8.3)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.8.3`
* **Hasil:** 0% packet loss, RTT rata-rata `1.656 ms`.
* **Analisis TTL:** Nilai `ttl=60` berkurang 4 hop dari standar awal (64), menandakan paket melewati hirarki router yang lebih dalam (`Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Schumann` $\rightarrow$ `Accela`) hingga mencapai segmen Switch5.

---

## 6. Pengujian Lintas Subnet: Kari ke Ghost (`kari-ghost.png`)

![Ping Kari ke Ghost](kari-ghost.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Wired` $\rightarrow$ `Tachibana` $\rightarrow$ `Switch9` $\rightarrow$ `Ghost (10.76.24.3)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.24.3`
* **Hasil:** 0% packet loss, RTT rata-rata `1.686 ms`.
* **Analisis TTL:** Nilai `ttl=61` membuktikan paket sukses melintasi core router jaringan **Wired** dan berpindah dari segmen Psyche menuju segmen Tachibana/Switch9.

---

## 7. Pengujian Lapisan Dalam: Kari ke Semi (`kari-semi.png`)

![Ping Kari ke Semi](kari-semi.png)

### Alur Perjalanan Paket (Routing Path):
`Kari` $\rightarrow$ `Psyche` $\rightarrow$ `Wired` $\rightarrow$ `Tachibana` $\rightarrow$ `Deus` $\rightarrow$ `Protocol7` $\rightarrow$ `Knights` $\rightarrow$ `Phantoma` $\rightarrow$ `Switch12` $\rightarrow$ `Semi (10.76.28.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.28.2`
* **Hasil:** 0% packet loss, RTT rata-rata `2.340 ms`.
* **Analisis TTL:** Nilai `ttl=57` adalah yang paling kecil dibanding pengujian lainnya. Ini dikarenakan node **Semi** terletak sangat jauh di lapisan terdalam topologi *The Wired*. Paket harus melompati 7 router (`Psyche` $\rightarrow$ `Wired` $\rightarrow$ `Tachibana` $\rightarrow$ `Deus` $\rightarrow$ `Protocol7` $\rightarrow$ `Knights` $\rightarrow$ `Phantoma`), sehingga TTL berkurang dari 64 menjadi 57 ($64 - 7 = 57$).

---

## 8. Pengujian Cabang Navi: Kari ke Alice (`kari-alice.png`)

![Ping Kari ke Alice](kari-alice.png)

### Alur Perjalanan Paket (Routing Path):
`Kari (eth0)` $\rightarrow$ `Switch3` $\rightarrow$ `Psyche` $\rightarrow$ `Switch2` $\rightarrow$ `Wired` $\rightarrow$ `Navi` $\rightarrow$ `Switch6` $\rightarrow$ `Alice (10.76.18.2)`

### Analisis Hasil:
* **Command:** `ping -c 2 10.76.18.2`
* **Hasil:** 0% packet loss, RTT rata-rata `1.509 ms`.
* **Analisis TTL:** Nilai `ttl=61` membuktikan bahwa keterhubungan antara cabang kiri (Psyche) dan cabang kanan (Navi) melalui router hub **Wired** telah ter-routing secara optimal.

---

## Kesimpulan Pembuktian
Berdasarkan seluruh hasil pengujian *ping* dari node **Kari**:
1. **Konektivitas 100%:** Seluruh paket uji (ICMP) mencapai target tanpa *packet loss* (0% loss) baik pada subnet lokal maupun antar-subnet beda cabang[cite: 1, 2].
2. **Routing Efisien:** Nilai TTL yang berkurang secara konsisten sesuai dengan jumlah hop router yang dilewati membuktikan tidak adanya *routing loop* dan tabel routing statis/CIDR telah dikonfigurasi dengan tepat[cite: 1, 2].
3. **Persyaratan Modul Terpenuhi:** Seluruh node dalam topologi terhubung penuh (*full reachability*) sesuai aturan praktikum[cite: 7].
