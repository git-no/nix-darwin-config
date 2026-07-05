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
- [x] Verschiedene User und Systeme (mehrere Hosts) unterstützen — Struktur unter [hosts/](hosts/) umgesetzt, siehe README-Abschnitt "Neuen Host hinzufügen"
- [ ] Home-Manager-Konfiguration pro Host unterscheidbar machen (aktuell für alle Hosts gemeinsam, siehe [home-manager/default.nix](home-manager/default.nix))
- [ ] `modules/system.nix` hardware-/host-spezifische Werte (z.B. `networking.knownNetworkServices`, Dock `persistent-apps`) bei Bedarf pro Host überschreibbar machen, z.B. via `hosts/<name>/configuration.nix`
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

Nicht umgesetzte Struktur-Ideen (aus dem Kickstarter-Template)
---------------------------------------------------------------

Die Multi-Host-Umstellung (`hosts/`) ist umgesetzt. Diese Teile des
ursprünglichen Templates gibt es weiterhin nicht und sind aktuell auch
nicht geplant, nur als Notiz falls später relevant:

```
checks/       # für flake checks
devshells/    # für devshells
lib/          # Nix-Funktionen
packages/     # eigene Pakete
templates/    # flake templates
```

Links
-----

- <https://formulae.brew.sh>
- Basierend auf: <https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo>
- <https://github.com/dustinlyons/nixos-config/blob/main>
- fd: <https://github.com/sharkdp/fd>
