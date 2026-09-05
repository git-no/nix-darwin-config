## Github NIX PNPM tools:

https://github.com/NixOS/nixpkgs/tree/nixos-unstable/pkgs/development/tools/pnpm

## KI prompt

Ich prüfe kurz, welche `nixpkgs`-Quelle dieses Flake tatsächlich pinnt. Davon hängt ab, ob `pnpm_12` schon verfügbar ist oder erst ein Update nötig wird.

Die Konfiguration bezieht die Home-Manager-Pakete über `nixpkgs-unstable`; der Eintrag `pnpm` wird daher aus genau diesem Input aufgelöst. Ich frage jetzt die konkrete, gelockte Version ab, damit die Anweisung nicht von Vermutungen lebt.

Ran terminal command:  nix eval --raw .#darwinConfigurations.BettyBlue.pkgs.pnpm.version

Der erste Abruf wurde von zsh am `#` abgeschnitten, nicht von Nix. Ich wiederhole denselben engen Check mit einem korrekt gequoteten Flake-Attribut.

Ran terminal command:  nix eval --raw '.#darwinConfigurations.BettyBlue.pkgs.pnpm.version'

Aktuell löst deine Konfiguration `pnpm` zu **Version 11.21.0** auf. Da Home Manager `nixpkgs-unstable` verwendet, ist der Weg zu pnpm 12:

```bash
cd ~/.config/nix
nix flake update nixpkgs-unstable
nix eval --raw '.#darwinConfigurations.BettyBlue.pkgs.pnpm_12.version'
```

Wenn der zweite Befehl eine 12.x-Version ausgibt, ändere in `packages.nix:3` den Eintrag:

```nix
pnpm
```

zu:

```nix
pnpm_12
```

Danach die Konfiguration aktivieren:

```bash
sudo darwin-rebuild switch --flake .
```

Falls `pnpm_12` beim `nix eval` noch nicht existiert, ist es noch nicht in dem gelockten Stand von `nixpkgs-unstable` enthalten. Dann bleibt nur, auf die Aufnahme in nixpkgs zu warten und später erneut `nix flake update nixpkgs-unstable` auszuführen.
