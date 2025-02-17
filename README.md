# nix-darwin

1. Installing Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

2. Installing / bootstraping nix-darwin

```bash
mkdir nix-darwin-config
cd nix-darwin-config
nix flake init -t nix-darwin

# Flake editieren

nix run nix-darwin -- switch --flake .#simple
```

evtl. Dateien wegsichern und löschen

3.  After handling these files, we can simply run the script again. nix-darwin is now bootstrapped on our system, which gives us the darwin-rebuild command that is similar to nixos-rebuild on NixOS hosts. We can now run anytime

```bash
darwin-rebuild switch --flake .#simple
```

## Updating system

After compiling packages

```bash
nix flake update
nix flake update --commit-lock-file
```

Upgrading Nix

```bash
sudo -i nix upgrade-nix
```

## Referenzen

https://github.com/DeterminateSystems/nix-installer

https://nixcademy.com/posts/nix-on-macos/
