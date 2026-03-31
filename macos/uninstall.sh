#!/bin/bash
# Osmanlica Transkripsiyon Klavye Duzeni - macOS Kaldirma Scripti

KEYLAYOUT="OsmanlicaTranskripsiyon.keylayout"
USER_DIR="$HOME/Library/Keyboard Layouts"
SYSTEM_DIR="/Library/Keyboard Layouts"
FOUND=0

echo "=== Osmanlica Transkripsiyon Klavye Duzeni Kaldiriliyor ==="

# Kullanici dizininden kaldir
if [ -f "$USER_DIR/$KEYLAYOUT" ]; then
    rm "$USER_DIR/$KEYLAYOUT"
    echo "Kullanici dizininden kaldirildi."
    FOUND=1
fi

# Sistem dizininden kaldir (.pkg ile kurulmussa)
if [ -f "$SYSTEM_DIR/$KEYLAYOUT" ]; then
    sudo rm "$SYSTEM_DIR/$KEYLAYOUT"
    echo "Sistem dizininden kaldirildi."
    FOUND=1
fi

if [ $FOUND -eq 0 ]; then
    echo "Klavye duzeni bulunamadi, zaten kurulu degil."
else
    echo ""
    echo "Kaldirma tamamlandi."
    echo "Degisikliklerin etkili olmasi icin oturumu kapatip tekrar acin."
fi
