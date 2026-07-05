TODO / Ideen
============

Offene Setup-Punkte
--------------------

- git config (Name/E-Mail final setzen, siehe [home-manager/git.nix](home-manager/git.nix))
- github ssl clone
- code dir
- Mitteilungszentrale
- [ ] System config Tastatur Kurzbefehle
- [ ] Screensaver
- [ ] Wetter in Menüleiste, Siri in Menüleiste ausblenden
- [ ] Control Center Shortcut
- [ ] .dot files <https://davi.sh/blog/2024/02/nix-home-manager/>
- [ ] Config-Dateien als Files spiegeln statt als Text in der Nix-Config
- [ ] Apps (VSC, Obsidian, Windows App) -> kontrollieren, ob sie in der App-Übersicht angezeigt werden; mit Obsidian anfangen
- [ ] App-Konfigurationsverzeichnisse (Dotfiles) sichern/verwalten
- [ ] Verschiedene User und Systeme (mehrere Hosts) unterstützen
- [ ] Secrets, SSH-Key sichern (z.B. GitHub-Autorisierung per SSH, known_hosts) — Kandidat: agenix oder sops-nix
- [ ] Alles, was im Home-Verzeichnis als Dotfile herumliegt, sichern
- [x] Darwin System-Config (Maus etc.) — Achtung: bei VSCode darauf achten, dass Settings bei `switch` nicht immer wieder leer/neu synchronisiert werden; Nix sollte die VSCode-Settings nicht überschreiben.

App-/Einstellungs-Recherche
----------------------------

- Transmit Einstellungen setzen
- Proton Einstellungen
- Windows-App Einstellungen, Verbindungen
- Fliq Einstellungen
- Systemsteuerung/Bedienungshilfen: Scroll-Geste mit Sondertaste zum Zoomen verwenden

Noch nicht deklarativ verwaltete Apps (Ideen)
----------------------------------------------

- Node, PNPM?
- Unarchiver
- A better Finder Rename
- AudioBookBuilder
- Postman/Insomnia?
- PHiewer
- Mindjet MindManager
- Steuern-App
- napp

Bereits erledigt
----------------

- [x] IINA
- [x] home-manager, Derivate, Homebrew
- [x] Screensaver Fliqlo
- [x] Little Snitch + AdBlocker <https://www.obdev.at/products/littlesnitch-mini/blocklists.html?ref=nelson.cloud>
- [x] Windows App RDP + exportierte Profile
- [x] Tower
- [x] 1Password
- [x] AppCleaner
- [x] MS Teams
- [x] Transmit FTP
- [x] Proton
- [x] Ice + Konfiguration
- [x] MonitorControl
- [ ] VSCode — Einstellungen/Sync noch nicht sauber deklarativ

Mögliche zukünftige Repo-Struktur
----------------------------------

Falls mehrere Hosts/User dazukommen, wäre folgende Struktur ein Kandidat
(aktuell **nicht** umgesetzt — heute ist alles fest auf einen Host verdrahtet,
siehe [flake.nix](flake.nix)):

```
checks/       # für flake checks
devshells/    # für devshells
hosts/        # Maschinen-Konfigurationen
hosts/*/users/  # Home-Manager-Konfigurationen pro Host/User
lib/          # Nix-Funktionen
modules/      # NixOS/nix-darwin Module
packages/     # eigene Pakete
templates/    # flake templates
```

Links
-----

- <https://formulae.brew.sh>
- Basierend auf: <https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo>
- <https://github.com/dustinlyons/nixos-config/blob/main>
- fd: <https://github.com/sharkdp/fd>
