# install\_chrome.sh — Panduan Singkat

Skrip tersedia di:
`https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh`

**Perintah singkat yang direkomendasikan:**

```bash
bash <(curl -fsSL https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh)
```

Perintah di atas mengunduh skrip dari URL tersebut dan langsung menjalankannya dengan `bash`.

---

## 3 Alternatif untuk pengguna yang khawatir tentang keamanan

### 1) Download → Periksa → Jalankan (paling aman)

```bash
curl -fsSL -o /tmp/install_chrome.sh https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh
less /tmp/install_chrome.sh    # atau nano, vim — periksa isinya
chmod +x /tmp/install_chrome.sh
bash /tmp/install_chrome.sh
```

### 2) Unduh + verifikasi checksum (jika tersedia)

```bash
curl -fsSL -o /tmp/install_chrome.sh https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh
curl -fsSL -o /tmp/install_chrome.sh.sha256 https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh.sha256
sha256sum -c /tmp/install_chrome.sh.sha256
bash /tmp/install_chrome.sh
```

> Catatan: penyedia skrip harus menaruh file `install_chrome.sh.sha256` di lokasi yang sama agar metode ini berjalan.

### 3) Pipe langsung (praktis, lebih berisiko)

```bash
curl -fsSL https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh | bash
```

atau dengan `wget`:

```bash
wget -qO- https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh | bash
```

---

## Tips Keamanan & Praktik Terbaik

* **Hindari** menjalankan skrip dari internet dengan `sudo` kecuali kamu yakin sumbernya. Lebih aman biarkan skrip menggunakan `sudo` untuk langkah tertentu.
* **Periksa isi skrip** sebelum menjalankan kalau memungkinkan. Cari perintah berbahaya seperti `rm -rf /` atau pengiriman data sensitif.
* **Sediakan checksum atau tanda tangan GPG** pada repo/situs agar pengguna bisa memverifikasi integritas file. Contoh membuat checksum (oleh pemilik skrip):

  ```bash
  sha256sum install_chrome.sh > install_chrome.sh.sha256
  ```
* **Gunakan URL yang dipin ke commit/release** agar isi skrip tidak berubah tanpa pemberitahuan.

---

## Catatan teknis

* Script ini kemungkinan memanggil `sudo` untuk menginstal paket atau menulis ke direktori sistem; pengguna mungkin diminta memasukkan password `sudo`.
* Process substitution (`bash <(curl ...)`) membutuhkan `bash`/`zsh` — jika pengguna memakai shell yang lebih minimal (mis. `dash`) perintah ini bisa gagal.
