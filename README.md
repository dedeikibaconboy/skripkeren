<!DOCTYPE html>

<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>🚀 Panduan install_chrome.sh</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 1rem;
      background: #f9fafb;
      color: #333;
      line-height: 1.6;
    }
    h1, h2, h3 {
      color: #222;
    }
    pre {
      position: relative;
      background: #282c34;
      color: #f8f8f2;
      padding: 1rem;
      border-radius: 10px;
      overflow-x: auto;
      margin-bottom: 1.5rem;
    }
    code {
      font-family: monospace;
      font-size: 0.95rem;
    }
    button.copy-btn {
      position: absolute;
      top: 8px;
      right: 8px;
      padding: 4px 10px;
      font-size: 12px;
      cursor: pointer;
      border: none;
      border-radius: 5px;
      background: #61dafb;
      color: #000;
      transition: background 0.3s;
    }
    button.copy-btn:hover {
      background: #21a1f1;
      color: #fff;
    }
    .section {
      margin-bottom: 2rem;
    }
  </style>
</head>
<body>
  <h1>🚀 Panduan install_chrome.sh</h1>
  <p>Skrip tersedia di: <code>https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh</code></p>

  <div class="section">
    <h2>💡 Cara Cepat (langsung eksekusi)</h2>
    <pre><code id="code1">bash <(curl -fsSL https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh)</code><button class="copy-btn" onclick="copyCode('code1')">Copy</button></pre>
  </div>

  <div class="section">
    <h2>🔒 Alternatif Aman</h2>
    <h3>🛡️ 1) Download → Periksa → Jalankan</h3>
    <pre><code id="code2">curl -fsSL -o /tmp/install_chrome.sh https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh
less /tmp/install_chrome.sh    # lihat isi skrip dulu
chmod +x /tmp/install_chrome.sh
bash /tmp/install_chrome.sh</code><button class="copy-btn" onclick="copyCode('code2')">Copy</button></pre>

```
<h3>🛡️ 2) Unduh + Verifikasi Checksum (jika tersedia)</h3>
<pre><code id="code3">curl -fsSL -o /tmp/install_chrome.sh https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh
```

curl -fsSL -o /tmp/install\_chrome.sh.sha256 [https://dedeikibaconboy.github.io/skripkeren/install\_chrome.sh.sha256](https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh.sha256)
sha256sum -c /tmp/install\_chrome.sh.sha256
bash /tmp/install\_chrome.sh</code><button class="copy-btn" onclick="copyCode('code3')">Copy</button></pre>

```
<h3>🛡️ 3) Pipe langsung (praktis, tapi berisiko)</h3>
<pre><code id="code4">curl -fsSL https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh | bash</code><button class="copy-btn" onclick="copyCode('code4')">Copy</button></pre>
<pre><code id="code5">wget -qO- https://dedeikibaconboy.github.io/skripkeren/install_chrome.sh | bash</code><button class="copy-btn" onclick="copyCode('code5')">Copy</button></pre>
```

  </div>

  <div class="section">
    <h2>🎨 Tips Keamanan</h2>
    <ul>
      <li>✅ Jangan jalankan skrip dengan <code>sudo</code> langsung kecuali benar-benar percaya sumbernya.</li>
      <li>✅ Selalu periksa isi skrip jika memungkinkan.</li>
      <li>✅ Gunakan checksum/GPG untuk memastikan integritas file.</li>
      <li>✅ Pin URL ke commit/release agar isi skrip tidak berubah tiba-tiba.</li>
    </ul>
  </div>

  <div class="section">
    <h2>📌 Catatan Teknis</h2>
    <p>Skrip ini mungkin meminta password <code>sudo</code> untuk instalasi paket.<br>
    Process substitution (<code>bash &lt;(curl ...)</code>) hanya jalan di <strong>bash/zsh</strong>, bukan shell minimal seperti <strong>dash</strong>.</p>
  </div>

  <script>
    function copyCode(id) {
      const code = document.getElementById(id).innerText;
      navigator.clipboard.writeText(code).then(() => {
        const btn = document.querySelector(`button[onclick="copyCode('${id}')"]`);
        btn.innerText = '✅ Copied!';
        setTimeout(() => btn.innerText = 'Copy', 1500);
      });
    }
  </script>

</body>
</html>
