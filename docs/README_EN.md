**🌐 English | [Русский](README_RU.md) | [Türkçe](../README.md)**

# Ottoman Turkish Transcription Keyboard Layout

A keyboard layout for **Linux** and **macOS** that makes it easy to type Ottoman Turkish transcription diacritical marks: ḏ, ā, ḍ, ġ, ḫ, ṣ, ṭ, ẓ, ʾ, ʿ and more.

Based on the Turkish Q layout. Transcription characters are accessed via the **AltGr** key (Linux) or **Option/⌥** key (macOS).

> **What is AltGr?** It's the Alt key on the right side of your keyboard. On some keyboards it's labeled "Alt Gr" or just "Alt".

## Contributors

- **Talat Öncü** — Developed the original Windows version: [osmtransklavye](https://www.oncu.com/osmtransklavye/)
- **Gülşah Nur Coşkun** (Istanbul Medeniyet University, Faculty of Letters, MA) — Identified the need for macOS support.
- **Yasin Korkmaz** (Istanbul Medeniyet University, Faculty of Letters, MA) — Ported the layout to Linux and macOS.

## Key Map

### Direct Access (AltGr / Option + letter)

| Key | Lower | Upper | Description |
|-----|-------|-------|-------------|
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

> **For uppercase:** Hold Shift while pressing AltGr + letter. Example: Shift+AltGr+A = Ā

### Dead Keys (AltGr / Option + key, then letter)

Dead keys work in two steps:
1. Press **AltGr + modifier key** and **release** (nothing appears on screen — this is normal)
2. Then press the desired **letter**

> **Example:** To type ḏ → press AltGr+Z and release, then press d.

| Key | Modifier | Usage |
|-----|----------|-------|
| AltGr+Z | line below | then d→ḏ, z→ẕ, t→ṯ, s→s̱ |
| AltGr+X | macron | then a→ā, u→ū, i→ī, e→ē, o→ō |
| AltGr+C | dot below | then d→ḍ, z→ẓ, k→ḳ, h→ḥ, t→ṭ, s→ṣ |
| AltGr+V | dot above | then g→ġ, z→ż |
| AltGr+B | breve below | then h→ḫ |

## Easy Installation (Recommended)

Download the installer from [Releases](https://github.com/podeveloper/osmanlica-transkripsiyon-klavye/releases/latest):

### Linux (Ubuntu / Debian)

1. Download the `.deb` file from [Releases](https://github.com/podeveloper/osmanlica-transkripsiyon-klavye/releases/latest)
2. **Double-click** the file and click "Install"
   - Or via terminal: `sudo dpkg -i osmanlica-klavye_*.deb`
3. Enable the layout:

**GNOME (Ubuntu default):**
- Settings → Keyboard → Input Sources → **+** → Under "Turkish" select **"Turkish (Ottoman Transcription Q)"**

**KDE (Kubuntu):**
- System Settings → Input Devices → Keyboard → Layouts → Add Layout → Variant: Ottoman Transcription

4. Switch between layouts using the keyboard icon in the menu bar
   - Shortcut: **Super+Space** (GNOME) or **Meta+Space** (KDE)

To uninstall: `sudo apt remove osmanlica-klavye`

> **Wayland users:** Ubuntu 22.04+ uses Wayland by default. The `setxkbmap` command doesn't work on Wayland. Use the Settings method above. To switch to X11, select "Ubuntu on Xorg" from the gear icon on the login screen.

### macOS

1. Download the `.pkg` file from [Releases](https://github.com/podeveloper/osmanlica-transkripsiyon-klavye/releases/latest)
2. **Double-click** the file and follow the installer
3. **Log out and log back in** (this step is required)
4. **System Preferences** → **Keyboard** → **Input Sources** → **+** → Select **"Turkish - Ottoman Transcription Q"** → **Add**
5. Switch layouts via the keyboard icon in the menu bar
   - Shortcut: **Ctrl+Space** or **fn+Space**

> On macOS, use the **Option (⌥)** key instead of AltGr. It's located next to the Command key.

<details>
<summary><strong>⚠️ Getting "unidentified developer" warning on macOS?</strong></summary>

macOS may block unsigned packages. Two ways to fix this:

**Option 1 — Right-click to open:**
- **Right-click** (or Control-click) the `.pkg` file → **Open** → Click **Open** again on the warning dialog

**Option 2 — Install via Terminal:**
```bash
# Remove quarantine flag
xattr -d com.apple.quarantine ~/Downloads/OsmanlicaTranskripsiyon-1.0.0.pkg

# Install
sudo installer -pkg ~/Downloads/OsmanlicaTranskripsiyon-1.0.0.pkg -target /
```

Both methods are safe — the file only contains a keyboard layout and does not modify system files.

</details>

## Verify Installation

1. Open any text editor (LibreOffice Writer, TextEdit, Notes, etc.)
2. Select the "Ottoman Transcription" keyboard layout
3. Press **AltGr+A** → you should see **ā**
4. Press **AltGr+N** → you should see **ʾ** (hamza)
5. Press AltGr+Z and release, then press **d** → you should see **ḏ**

If all characters appear correctly, the installation is successful!

> **If you see □ instead of characters:** Your font doesn't support these characters. Try "Noto Serif", "DejaVu Sans", or "Times New Roman".

## Troubleshooting

| Problem | Solution |
|---------|----------|
| AltGr key doesn't work | Run `setxkbmap -option lv3:ralt_switch` in terminal |
| □ appears instead of characters | Use a Unicode-compatible font (Noto Serif, DejaVu Sans) |
| `setxkbmap` doesn't work | You may be on Wayland. Use Settings → Keyboard instead |
| Layout not visible on macOS | Log out and back in. If still missing, restart |
| Dead key produces nothing | Press AltGr+Z and **release**, then press the letter. Don't hold both |

## Requirements

- **Linux**: Ubuntu, Debian or derivatives (X11/Wayland + XKB + Python 3)
- **macOS**: macOS 10.9 or later

## License

MIT License — see [LICENSE](../LICENSE) for details.
