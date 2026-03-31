#!/bin/bash
# macOS .pkg installer olusturma scripti
# Bu script macOS uzerinde calistirilmalidir
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
VERSION="1.0.0"
PKG_NAME="OsmanlicaTranskripsiyon"
IDENTIFIER="com.podeveloper.osmanlica-klavye"

BUILD_DIR="$SCRIPT_DIR/build"
PAYLOAD_DIR="$BUILD_DIR/payload"
SCRIPTS_DIR="$BUILD_DIR/scripts"

rm -rf "$BUILD_DIR"
mkdir -p "$PAYLOAD_DIR/Library/Keyboard Layouts"
mkdir -p "$SCRIPTS_DIR"

# Keylayout dosyasini kopyala
cp "$REPO_ROOT/macos/OsmanlicaTranskripsiyon.keylayout" "$PAYLOAD_DIR/Library/Keyboard Layouts/"

# Post-install script
cat > "$SCRIPTS_DIR/postinstall" << 'POSTEOF'
#!/bin/bash
echo ""
echo "============================================="
echo "  Osmanlica Transkripsiyon Klavyesi kuruldu!"
echo "============================================="
echo ""
echo "Etkinlestirmek icin:"
echo "  1. Sistem Tercihleri > Klavye > Giris Kaynaklari"
echo "  2. '+' tusuna basin"
echo "  3. 'Turkish - Ottoman Transcription Q' secin"
echo ""
echo "NOT: Oturumu kapatip acmaniz gerekebilir."
echo ""
POSTEOF
chmod 755 "$SCRIPTS_DIR/postinstall"

# .pkg olustur
pkgbuild \
    --root "$PAYLOAD_DIR" \
    --scripts "$SCRIPTS_DIR" \
    --identifier "$IDENTIFIER" \
    --version "$VERSION" \
    --install-location "/" \
    "$SCRIPT_DIR/${PKG_NAME}-${VERSION}.pkg"

echo "Paket olusturuldu: ${PKG_NAME}-${VERSION}.pkg"

# Temizlik
rm -rf "$BUILD_DIR"
