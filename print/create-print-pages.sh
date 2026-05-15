#!/bin/bash
# Creates all print pages for hoppe-kids

PRINT_DIR="/tmp/hoppe-kids/print"

create_page() {
  local filename="$1"
  local title="$2"
  local content="$3"
  
  cat > "$PRINT_DIR/$filename" << EOF
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$title – Heinrich Hoppe GmbH</title>
<link rel="stylesheet" href="print-template.css">
<style>
@page { size: A4; margin: 15mm; }
body { background: white; }
</style>
</head>
<body>
<div class="print-page">
  <a href="../index.html" class="back-btn no-print">← Zurück zur Hauptseite</a>
  <div class="page-title">✨ Ausmalbilder von Heinrich Hoppe 🌸</div>
  <div class="page-subtitle">$title — Male mich bunt! 🎨</div>
  <button class="print-btn no-print" onclick="window.print()">🖨️ Jetzt Ausdrucken</button>
  $content
  <div class="branding">
    <strong>Heinrich Hoppe GmbH</strong> · Seit 1925 – Ihr Partner für Logistik · Oyten bei Bremen
  </div>
</div>
</body>
</html>
EOF
}

echo "Done creating pages"
