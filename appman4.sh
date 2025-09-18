#!/bin/bash

# Deteksi package manager
if command -v apt >/dev/null 2>&1; then
  PKG_INSTALL="sudo apt install -y"
  PKG_REMOVE="sudo apt remove -y"
  PKG_SEARCH="apt-cache search"
  PKG_CHECK="dpkg -l"
elif command -v ppm >/dev/null 2>&1; then
  PKG_INSTALL="ppm install"
  PKG_REMOVE="ppm remove"
  PKG_SEARCH="ppm search"
  PKG_CHECK="ppm list"
else
  echo "❌ Tidak ditemukan package manager (apt/ppm)."
  exit 1
fi

# Fungsi: tampilkan menu
show_menu() {
  echo "============================"
  echo "   MENU PENGELOLA APLIKASI  "
  echo "============================"
  echo "1. Cari & Uninstall aplikasi"
  echo "2. Install aplikasi (by name)"
  echo "0. Keluar"
  echo "============================"
}

# Fungsi: buat shortcut desktop
make_shortcut_and_run() {
  app_exec="$1"
  app_name="$2"
  desktop_file="$HOME/Desktop/$app_name.desktop"

  if [ -f "$desktop_file" ]; then
    echo "ℹ️ Shortcut untuk $app_name sudah ada di Desktop."
  else
    echo "🖥️ Membuat shortcut di Desktop: $desktop_file"

    cat > "$desktop_file" <<EOF
[Desktop Entry]
Name=$app_name
Exec=$app_exec
Type=Application
Terminal=false
Icon=application-default-icon
EOF

    chmod +x "$desktop_file"
  fi

  echo "🚀 Menjalankan $app_name..."
  nohup "$app_exec" >/dev/null 2>&1 &
}

# Fungsi: uninstall aplikasi
uninstall_apps() {
  echo "🔍 Mendeteksi aplikasi yang terinstall..."
  if [[ $PKG_CHECK == "dpkg -l" ]]; then
    mapfile -t installed < <(dpkg -l | awk '{print $2}' | tail -n +6)
  else
    mapfile -t installed < <($PKG_CHECK | awk '{print $1}')
  fi

  if [ ${#installed[@]} -eq 0 ]; then
    echo "⚠️ Tidak ada aplikasi terinstall."
    return
  fi

  read -p "Masukkan nama aplikasi yang ingin dihapus: " app_name

  if printf '%s\n' "${installed[@]}" | grep -qw "$app_name"; then
    read -p "Yakin ingin uninstall $app_name? (y/n): " ans
    if [[ $ans == "y" ]]; then
      $PKG_REMOVE "$app_name"
    else
      echo "❌ Batal uninstall $app_name"
    fi
  else
    echo "⚠️ Tidak ada aplikasi persis bernama '$app_name'."
    echo "🔎 Menampilkan kandidat mirip:"
    mapfile -t candidates < <(printf '%s\n' "${installed[@]}" | grep -i "$app_name")

    if [ ${#candidates[@]} -eq 0 ]; then
      echo "❌ Tidak ada kandidat yang mirip dengan '$app_name'."
      return
    fi

    for i in "${!candidates[@]}"; do
      echo "$((i+1)). ${candidates[$i]}"
    done

    read -p "Masukkan nomor aplikasi yang ingin dihapus (pisahkan dengan spasi): " nums
    for num in $nums; do
      app="${candidates[$((num-1))]}"
      if [ -n "$app" ]; then
        read -p "Yakin ingin uninstall $app? (y/n): " ans
        if [[ $ans == "y" ]]; then
          $PKG_REMOVE "$app"
        else
          echo "❌ Batal uninstall $app"
        fi
      fi
    done
  fi
}

# Fungsi: install aplikasi
install_apps() {
  read -p "Ketik nama aplikasi yang ingin diinstall: " app_name

  echo "🔍 Mencari '$app_name' di repositori..."
  mapfile -t results < <($PKG_SEARCH "$app_name" | head -n 20)

  if [ ${#results[@]} -eq 0 ]; then
    echo "⚠️ Tidak ada hasil untuk '$app_name'."
    return
  fi

  echo "📦 Ditemukan kandidat paket:"
  for i in "${!results[@]}"; do
    echo "$((i+1)). ${results[$i]}"
  done

  read -p "Masukkan nomor paket yang ingin diinstall: " num
  selected=$(echo "${results[$((num-1))]}" | awk '{print $1}')

  if [ -n "$selected" ]; then
    if $PKG_CHECK | grep -qw "$selected"; then
      echo "✅ $selected sudah terinstall."

      app_exec=$(command -v "$selected")
      if [ -z "$app_exec" ]; then
        app_exec=$(ls /usr/bin | grep -m1 "$selected")
      fi

      if [ -n "$app_exec" ]; then
        make_shortcut_and_run "$app_exec" "$selected"
      else
        echo "⚠️ Tidak ditemukan binary untuk $selected, shortcut tidak dibuat."
      fi
    else
      read -p "Install $selected? (y/n): " ans
      if [[ $ans == "y" ]]; then
        $PKG_INSTALL "$selected"

        app_exec=$(command -v "$selected")
        if [ -z "$app_exec" ]; then
          app_exec=$(ls /usr/bin | grep -m1 "$selected")
        fi

        if [ -n "$app_exec" ]; then
          make_shortcut_and_run "$app_exec" "$selected"
        else
          echo "⚠️ Tidak ditemukan binary untuk $selected, shortcut tidak dibuat."
        fi
      else
        echo "❌ Batal install $selected"
      fi
    fi
  else
    echo "⚠️ Pilihan tidak valid."
  fi
}

# Loop utama
while true; do
  show_menu
  read -p "Pilih menu: " choice
  case $choice in
    1) uninstall_apps ;;
    2) install_apps ;;
    0) echo "👋 Keluar..."; exit 0 ;;
    *) echo "⚠️ Pilihan tidak valid." ;;
  esac
done
