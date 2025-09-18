# 🚀 Script Install Chrome via Debian Terminal

Skrip tersedia di:
👉 `https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh`

---

## 💡 Cara Cepat (langsung eksekusi)

Klik tombol **Copy** lalu tempel di terminal kamu:

```bash
bash <(curl -fsSL https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh)
```

---

## 🔒 Alternatif Aman untuk yang Waspada

### 🛡️ 1) Download → Periksa → Jalankan

```bash
curl -fsSL -o /tmp/install_chrome.sh https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh
less /tmp/install_chrome.sh    # lihat isi skrip dulu
chmod +x /tmp/install_chrome.sh
bash /tmp/install_chrome.sh
```

### 🛡️ 2) Unduh + Verifikasi Checksum (jika tersedia)

```bash
curl -fsSL -o /tmp/install_chrome.sh https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh
curl -fsSL -o /tmp/install_chrome.sh.sha256 https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh.sha256
sha256sum -c /tmp/install_chrome.sh.sha256
bash /tmp/install_chrome.sh
```

> ⚠️ Perlu file `install_chrome.sh.sha256` dari penyedia skrip.

### 🛡️ 3) Pipe Langsung (praktis, tapi lebih berisiko)

```bash
curl -fsSL https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh | bash
```

atau dengan `wget`:

```bash
wget -qO- https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh | bash
```

---

## 🎨 Tips Keamanan & Best Practice

* ✅ Jangan asal `sudo` pada skrip online. Biarkan skrip minta `sudo` hanya jika perlu.
* ✅ Selalu cek isi skrip kalau bisa (pakai `less`/`nano`).
* ✅ Gunakan checksum/GPG untuk memastikan file tidak dimodifikasi jahat.
* ✅ Gunakan URL yang stabil (commit/release) agar isi skrip tidak berubah tiba-tiba.

---

## 💡 Coba juga App Manager 

Berguna banged u install dan uninstall :

```bash
bash <(curl -fsSL https://dedeikibaconboy.github.io/skripkeren/appman3.sh)
```

---

---

## 📌 Catatan Teknis

* Skrip ini mungkin akan minta password `sudo` karena perlu install paket.
* `bash <(curl ...)` hanya jalan di shell modern (bash/zsh). Kalau pakai `dash`, gunakan opsi pipe biasa.
