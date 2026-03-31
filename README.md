# Osmanlıca Transkripsiyon Klavye Düzeni

Osmanlı Türkçesi transkripsiyon işaretlerini (ḏ, ā, ḍ, ġ, ḫ, ṣ, ṭ, ẓ, ʾ, ʿ vb.) kolayca yazmak için **Linux** ve **macOS** klavye düzeni.

Türkçe Q klavye düzeni temel alınarak, **AltGr** (Linux) veya **Option/⌥** (macOS) tuşu ile transkripsiyon karakterlerine erişim sağlar.

> **AltGr tuşu nedir?** Klavyenizin sağ tarafındaki Alt tuşudur. Bazı klavyelerde "Alt Gr" veya sadece "Alt" olarak etiketlenmiştir.

## Katkıda Bulunanlar

- **Talat Öncü** — Bu klavye düzeninin orijinal Windows sürümünü geliştirmiştir: [osmtransklavye](https://www.oncu.com/osmtransklavye/)
- **Gülşah Nur Coşkun** (İstanbul Medeniyet Üniversitesi, Edebiyat Fakültesi, Yüksek Lisans) — macOS platformundaki eksikliği tespit edip bildirmiştir.
- **Yasin Korkmaz** (İstanbul Medeniyet Üniversitesi, Edebiyat Fakültesi, Yüksek Lisans) — Orijinal Windows sürümünü önce Linux'a, ardından macOS'a uyarlamıştır.

## Tuş Haritası

### Doğrudan Erişim (AltGr / Option + harf)

En sık kullanılan karakterlere tek tuşla erişim:

| Tuş | Küçük | Büyük | Açıklama |
|-----|-------|-------|----------|
| AltGr+A | ā | Ā | a with macron |
| AltGr+D | ḏ | Ḏ | d with line below |
| AltGr+E | ē | Ē | e with macron |
| AltGr+G | ġ | Ġ | g with dot above |
| AltGr+H | ḫ | Ḫ | h with breve below |
| AltGr+I | ī | Ī | i with macron |
| AltGr+K | ḳ | Ḳ | k with dot below |
| AltGr+O | ō | Ō | o with macron |
| AltGr+S | ṣ | Ṣ | s with dot below |
| AltGr+T | ṭ | Ṭ | t with dot below |
| AltGr+U | ū | Ū | u with macron |
| AltGr+N | ʾ | ʾ | hamza |
| AltGr+M | ʿ | ʿ | ayn |

> **Büyük harf yazmak için:** Shift tuşunu basılı tutarak AltGr + harf kombinasyonunu kullanın. Örnek: Shift+AltGr+A = Ā

### Dead Key'ler (AltGr / Option + tuş, ardından harf)

Dead key'ler iki adımda çalışır:
1. Önce **AltGr + işaret tuşuna** basın ve **bırakın** (ekranda hiçbir şey görünmez, bu normaldir)
2. Sonra istediğiniz **harfe** basın

> **Örnek:** ḏ yazmak için → önce AltGr+Z'ye basıp bırakın, sonra d'ye basın.

| Tuş | İşaret | Kullanım |
|-----|--------|----------|
| AltGr+Z | alt çizgi (line below) | sonra d→ḏ, z→ẕ, t→ṯ, s→s̱ |
| AltGr+X | üst çizgi (macron) | sonra a→ā, u→ū, i→ī, e→ē, o→ō |
| AltGr+C | alt nokta (dot below) | sonra d→ḍ, z→ẓ, k→ḳ, h→ḥ, t→ṭ, s→ṣ |
| AltGr+V | üst nokta (dot above) | sonra g→ġ, z→ż |
| AltGr+B | alt kavis (breve below) | sonra h→ḫ |

## Kolay Kurulum (Önerilen)

[Releases](https://github.com/podeveloper/osmanlica-transkripsiyon-klavye/releases/latest) sayfasından hazır paketi indirip kurun:

### Linux (Ubuntu / Debian)

1. [Releases](https://github.com/podeveloper/osmanlica-transkripsiyon-klavye/releases/latest) sayfasından `.deb` dosyasını indirin
2. Dosyaya **çift tıklayın** ve "Yükle" butonuna basın
   - Veya terminalde: `sudo dpkg -i osmanlica-klavye_*.deb`
3. Klavye düzenini etkinleştirin:

**GNOME (Ubuntu varsayılan):**
- Ayarlar → Klavye → Giriş Kaynakları → **+** butonuna basın → "Türkçe" altından **"Turkish (Ottoman Transcription Q)"** seçin

**KDE (Kubuntu):**
- Sistem Ayarları → Giriş Aygıtları → Klavye → Düzenler → Düzeni Ekle → Variant: Ottoman Transcription

4. Menü çubuğundaki klavye simgesinden (🇹🇷) düzenler arasında geçiş yapabilirsiniz
   - Kısayol: **Super+Space** (GNOME) veya **Meta+Space** (KDE)

Kaldırmak için: `sudo apt remove osmanlica-klavye`

> **Wayland Kullanıcıları:** Ubuntu 22.04 ve sonrası varsayılan olarak Wayland kullanır. Wayland'da `setxkbmap` komutu çalışmaz. Yukarıdaki Ayarlar yöntemini kullanın. X11 oturumuna geçmek isterseniz, giriş ekranında kullanıcı adınızı seçtikten sonra sağ alttaki dişli simgesinden "Ubuntu on Xorg" seçin.

### macOS

1. [Releases](https://github.com/podeveloper/osmanlica-transkripsiyon-klavye/releases/latest) sayfasından `.pkg` dosyasını indirin
2. Dosyaya **çift tıklayın** ve kurulum sihirbazını takip edin
3. **Oturumu kapatıp tekrar açın** (bu adım zorunludur)
4. **Sistem Tercihleri** → **Klavye** → **Giriş Kaynakları** → **+** → **"Turkish - Ottoman Transcription Q"** seçin → **Ekle**
5. Menü çubuğundaki klavye simgesinden düzenler arasında geçiş yapabilirsiniz
   - Kısayol: **Ctrl+Space** veya **fn+Space**

> macOS'ta AltGr yerine **Option (⌥)** tuşu kullanılır. Option tuşu klavyenin sol alt kısmında, Command tuşunun yanındadır.

## Kurulumu Doğrulama

Kurulumdan sonra düzgün çalışıp çalışmadığını test edin:

1. Bir metin düzenleyici açın (LibreOffice Writer, TextEdit, NotePad vb.)
2. Klavye düzenini "Ottoman Transcription" olarak seçin
3. **AltGr+A** tuşuna basın → **ā** karakteri görünmelidir
4. **AltGr+N** tuşuna basın → **ʾ** (hamza) karakteri görünmelidir
5. **AltGr+Z** tuşuna basıp bırakın, sonra **d** tuşuna basın → **ḏ** karakteri görünmelidir

Tüm karakterler düzgün görünüyorsa kurulum başarılıdır!

> **Karakter yerine kutucuk (□) görünüyorsa:** Kullandığınız yazı tipi (font) bu karakterleri desteklemiyor olabilir. "Noto Serif", "DejaVu Sans" veya "Times New Roman" gibi Unicode desteği geniş bir yazı tipini deneyin.

## Elle Kurulum (Gelişmiş)

<details>
<summary>Linux - terminal ile kurulum</summary>

```bash
cd linux
sudo bash install.sh
```

Etkinleştirmek için:
```bash
setxkbmap -layout tr -variant osmanlica
```

Normal Türkçe Q'ya dönmek için:
```bash
setxkbmap -layout tr
```

Kaldırma:
```bash
cd linux
sudo bash uninstall.sh
```

</details>

<details>
<summary>macOS - terminal ile kurulum</summary>

```bash
cd macos
bash install.sh
```

Kurulumdan sonra **oturumu kapatıp tekrar açın**.

Kaldırma:
```bash
cd macos
bash uninstall.sh
```

</details>

## Sorun Giderme

| Sorun | Çözüm |
|-------|-------|
| AltGr tuşu çalışmıyor | Bazı klavyelerde sağ Alt, AltGr olarak yapılandırılmamış olabilir. Terminal açıp `setxkbmap -option lv3:ralt_switch` yazın. |
| Karakter yerine □ görünüyor | Unicode destekli bir font kullanın: Noto Serif, DejaVu Sans, Times New Roman |
| `setxkbmap` komutu çalışmıyor | Wayland kullanıyor olabilirsiniz. Ayarlar > Klavye üzerinden ekleyin. |
| macOS'ta klavye listede görünmüyor | Oturumu kapatıp tekrar açın. Hâlâ görünmüyorsa bilgisayarı yeniden başlatın. |
| Dead key'den sonra karakter çıkmıyor | AltGr+Z'ye basıp **bıraktıktan sonra** harfe basın. İki tuşu aynı anda basmayın. |

## Gereksinimler

- **Linux**: Ubuntu, Debian veya türevi dağıtımlar (X11/Wayland + XKB + Python 3)
- **macOS**: macOS 10.9 veya üzeri

## Lisans

MIT License - detaylar için [LICENSE](LICENSE) dosyasına bakın.
