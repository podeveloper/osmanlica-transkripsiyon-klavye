#!/bin/bash
# Osmanlica Transkripsiyon Klavye Duzeni - macOS Kurulum Scripti
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
KEYLAYOUT="OsmanlicaTranskripsiyon.keylayout"
INSTALL_DIR="$HOME/Library/Keyboard Layouts"

echo "=== Osmanlica Transkripsiyon Klavye Duzeni - macOS Kurulumu ==="
echo ""

# Hedef dizini olustur
mkdir -p "$INSTALL_DIR"

# Keylayout dosyasini kopyala
if [ -f "$INSTALL_DIR/$KEYLAYOUT" ]; then
    echo "Mevcut klavye duzeni guncelleniyor..."
fi

cp "$SCRIPT_DIR/$KEYLAYOUT" "$INSTALL_DIR/$KEYLAYOUT"
echo "Klavye duzeni yuklendi: $INSTALL_DIR/$KEYLAYOUT"

echo ""
echo "=== Kurulum tamamlandi! ==="
echo ""
echo "Etkinlestirmek icin:"
echo "  1. Sistem Tercihleri (System Preferences) > Klavye (Keyboard) > Giris Kaynaklari (Input Sources)"
echo "  2. '+' tusuna basin"
echo "  3. 'Turkish - Ottoman Transcription Q' secin"
echo "  4. Ekle (Add) tusuna basin"
echo ""
echo "NOT: Degisikliklerin etkili olmasi icin oturumu kapatip acmaniz gerekebilir."
echo ""
echo "Kullanim:"
echo "  Option(⌥)+A = ā   Option+D = ḏ   Option+E = ē"
echo "  Option+G = ġ       Option+H = ḫ   Option+I = ī"
echo "  Option+K = ḳ       Option+O = ō   Option+S = ṣ"
echo "  Option+T = ṭ       Option+U = ū"
echo "  Option+N = ʾ (hamza)   Option+M = ʿ (ayn)"
