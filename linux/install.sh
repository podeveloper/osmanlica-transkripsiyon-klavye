#!/bin/bash
# Osmanlica Transkripsiyon Klavye Duzeni - Linux Kurulum Scripti
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
XKB_SYMBOLS="/usr/share/X11/xkb/symbols/tr"
EVDEV_XML="/usr/share/X11/xkb/rules/evdev.xml"

echo "=== Osmanlica Transkripsiyon Klavye Duzeni - Linux Kurulumu ==="
echo ""

# python3 kontrolu
if ! command -v python3 &>/dev/null; then
    echo "HATA: python3 bulunamadi. Lutfen yukleyin: sudo apt install python3"
    exit 1
fi

# Root kontrolu
if [ "$EUID" -ne 0 ]; then
    echo "Bu script root yetkisi gerektirir."
    echo "Kullanim: sudo bash $0"
    exit 1
fi

SUDO=""
if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
fi

# 1. Yedekle
echo "[1/4] Sistem dosyalari yedekleniyor..."
TIMESTAMP=$(date +%Y%m%d%H%M%S)
$SUDO cp "$XKB_SYMBOLS" "${XKB_SYMBOLS}.backup.${TIMESTAMP}"
$SUDO cp "$EVDEV_XML" "${EVDEV_XML}.backup.${TIMESTAMP}"
echo "  -> Yedekler olusturuldu."

# 2. XKB symbols
echo "[2/4] Klavye duzeni ekleniyor..."
if grep -q 'xkb_symbols "osmanlica"' "$XKB_SYMBOLS"; then
    echo "  -> Variant zaten mevcut, atlaniyor."
else
    echo "" | $SUDO tee -a "$XKB_SYMBOLS" > /dev/null
    cat "$SCRIPT_DIR/tr_osmanlica" | $SUDO tee -a "$XKB_SYMBOLS" > /dev/null
    echo "  -> XKB variant eklendi."
fi

# 3. evdev.xml
echo "[3/4] Sistem kaydi yapiliyor..."
if grep -q "osmanlica" "$EVDEV_XML"; then
    echo "  -> Kayit zaten mevcut, atlaniyor."
else
    $SUDO python3 -c "
import xml.etree.ElementTree as ET
tree = ET.parse('$EVDEV_XML')
root = tree.getroot()
for layout in root.iter('layout'):
    config = layout.find('configItem')
    if config is not None and config.find('name') is not None:
        if config.find('name').text == 'tr':
            vl = layout.find('variantList')
            if vl is None:
                vl = ET.SubElement(layout, 'variantList')
            v = ET.SubElement(vl, 'variant')
            c = ET.SubElement(v, 'configItem')
            n = ET.SubElement(c, 'name')
            n.text = 'osmanlica'
            d = ET.SubElement(c, 'description')
            d.text = 'Turkish (Ottoman Transcription Q)'
            s = ET.SubElement(c, 'shortDescription')
            s.text = 'tr'
            break
ET.indent(tree, space='  ')
tree.write('$EVDEV_XML', encoding='UTF-8', xml_declaration=True)
"
    echo "  -> evdev.xml guncellendi."
fi

# 4. XCompose
echo "[4/4] XCompose ayarlaniyor..."
XCOMPOSE="$HOME/.XCompose"
if [ -n "$SUDO_USER" ]; then
    XCOMPOSE="/home/$SUDO_USER/.XCompose"
fi

if [ -f "$XCOMPOSE" ]; then
    if grep -q "Ottoman Turkish" "$XCOMPOSE"; then
        echo "  -> XCompose zaten ayarli."
    else
        cat "$SCRIPT_DIR/XCompose_osmanlica" >> "$XCOMPOSE"
        echo "  -> XCompose guncellendi."
    fi
else
    cp "$SCRIPT_DIR/XCompose_osmanlica" "$XCOMPOSE"
    if [ -n "$SUDO_USER" ]; then
        chown "$SUDO_USER:$SUDO_USER" "$XCOMPOSE"
    fi
    echo "  -> XCompose olusturuldu."
fi

echo ""
echo "=== Kurulum tamamlandi! ==="
echo ""
echo "Etkinlestirmek icin:"
echo "  setxkbmap -layout tr -variant osmanlica"
echo ""
echo "Normal Turkce Q'ya donmek icin:"
echo "  setxkbmap -layout tr"
echo ""
echo "Kalici yapmak icin: Ayarlar > Klavye > 'Turkish (Ottoman Transcription Q)'"
