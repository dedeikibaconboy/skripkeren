#!/bin/bash
# =======================================================
#  Script Install Google Chrome untuk Debian/Dekuve
# =======================================================
# Cara pakai:
# 1. Simpan file ini, misalnya dengan nama: install_chrome.sh
#    nano install_chrome.sh
#
# 2. Kasih izin eksekusi:
#    chmod +x install_chrome.sh
#
# 3. Jalankan:
#    ./install_chrome.sh
#
# Setelah selesai:
#  - Shortcut Chrome akan ada di Desktop
#  - Chrome langsung terbuka otomatis
# =======================================================

# Hentikan jika ada error
set -e

echo "🚀 Memulai instalasi Google Chrome..."

# Update repository
sudo apt update -y

# Install dependensi yang dibutuhkan
sudo apt install -y wget gnupg apt-transport-https curl software-properties-common

# Download paket Google Chrome stable
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb

# Install paket Chrome
sudo apt install -y /tmp/google-chrome.deb

# Bersihkan file installer
rm /tmp/google-chrome.deb

echo "✅ Google Chrome berhasil terinstall!"

# Buat shortcut di Desktop
SHORTCUT_FILE="$HOME/Desktop/google-chrome.desktop"
cat > "$SHORTCUT_FILE" <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=Google Chrome
Exec=/usr/bin/google-chrome-stable %U
Icon=google-chrome
Terminal=false
Categories=Network;WebBrowser;
EOL

# Kasih permission agar shortcut bisa dieksekusi
chmod +x "$SHORTCUT_FILE"

echo "📌 Shortcut Google Chrome berhasil dibuat di Desktop."

# Jalankan Chrome
echo "🚀 Membuka Google Chrome..."
google-chrome-stable >/dev/null 2>&1 &

echo "🎉 Semua selesai! Selamat berselancar 🚀"
