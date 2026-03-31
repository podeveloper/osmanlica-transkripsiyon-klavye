#!/bin/bash
# Osmanlica Transkripsiyon Klavye Duzeni - Linux Kaldirma Scripti
set -e

XKB_SYMBOLS="/usr/share/X11/xkb/symbols/tr"
EVDEV_XML="/usr/share/X11/xkb/rules/evdev.xml"

echo "=== Osmanlica Transkripsiyon Klavye Duzeni Kaldiriliyor ==="

SUDO=""
if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
fi

# 1. XKB symbols'den varianti kaldir
echo "[1/3] XKB varianti kaldiriliyor..."
if grep -q 'xkb_symbols "osmanlica"' "$XKB_SYMBOLS"; then
    # osmanlica blogunun baslangic ve bitis satirlarini bul ve sil
    $SUDO python3 -c "
with open('$XKB_SYMBOLS', 'r') as f:
    content = f.read()
# Find and remove the osmanlica block
import re
pattern = r'\n*// Ottoman Turkish Transcription.*?^};'
content = re.sub(pattern, '', content, flags=re.DOTALL | re.MULTILINE)
# Also try simpler pattern
pattern2 = r'\n*partial alphanumeric_keys\nxkb_symbols \"osmanlica\".*?^};'
content = re.sub(pattern2, '', content, flags=re.DOTALL | re.MULTILINE)
with open('$XKB_SYMBOLS', 'w') as f:
    f.write(content)
"
    echo "  -> XKB varianti kaldirildi."
else
    echo "  -> Variant bulunamadi, atlaniyor."
fi

# 2. evdev.xml'den kaydi kaldir
echo "[2/3] evdev.xml kaydi kaldiriliyor..."
if grep -q "osmanlica" "$EVDEV_XML"; then
    $SUDO python3 -c "
import xml.etree.ElementTree as ET
tree = ET.parse('$EVDEV_XML')
root = tree.getroot()
for layout in root.iter('layout'):
    config = layout.find('configItem')
    if config is not None and config.find('name') is not None:
        if config.find('name').text == 'tr':
            vl = layout.find('variantList')
            if vl is not None:
                for v in vl.findall('variant'):
                    c = v.find('configItem')
                    if c is not None:
                        n = c.find('name')
                        if n is not None and n.text == 'osmanlica':
                            vl.remove(v)
                            break
            break
ET.indent(tree, space='  ')
tree.write('$EVDEV_XML', encoding='UTF-8', xml_declaration=True)
"
    echo "  -> evdev.xml kaydi kaldirildi."
else
    echo "  -> Kayit bulunamadi, atlaniyor."
fi

# 3. XCompose
echo "[3/3] XCompose temizleniyor..."
XCOMPOSE="$HOME/.XCompose"
if [ -n "$SUDO_USER" ]; then
    XCOMPOSE="/home/$SUDO_USER/.XCompose"
fi
if [ -f "$XCOMPOSE" ] && grep -q "Ottoman Turkish" "$XCOMPOSE"; then
    sed -i '/Ottoman Turkish/,/dead_belowmacron.*<S>/d' "$XCOMPOSE"
    # Bos kaldiysa sil
    if [ ! -s "$XCOMPOSE" ]; then
        rm "$XCOMPOSE"
    fi
    echo "  -> XCompose temizlendi."
fi

# Normal klavyeye don
setxkbmap -layout tr 2>/dev/null || true

echo ""
echo "=== Kaldirma tamamlandi! ==="
echo "Klavye normal Turkce Q'ya donduruldu."
