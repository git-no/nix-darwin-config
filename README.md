# macOS Setup - declarative configuration with nix, nix-darwin, home-manager

## Steps to bootsrap a new Mac

1. Install Apple's Command Line Tools, whic hare prerequisites for Nix-Darwin, Git Homebrew and more

```bash
xcode-select --install
```

2. Clone repo into new hidden directory

```bash
# use SSH (if set up)
git clone git@github.com:git-no/nix-darwin-config.git ~/.nix-darwin-config

# use HTTPS and witch remotes later
git clone https://github.com/git-no/nix-darwin-config.git ~/.nix-darwin-config
```

[dotfiles in 100 Seconds](https://www.youtube.com/watch?v=r_MpUP6aKiQ)

## Installation

1. Installing Nix

```bash
xcode-select --install
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

2. Botstrapping nix-darwin

```bash
mkdir .nix-darwin-config
cd .nix-darwin-config
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

- [Determinate Nix](https://github.com/DeterminateSystems/nix-installer)
- [Description nix-on-macos](https://nixcademy.com/posts/nix-on-macos/)

[Darwin Configuration Options](https://daiderd.com/nix-darwin/manual/index.html)

https://www.youtube.com/watch?v=JCeYq72Sko0

## ToDo

- Configuration multiple computers and systems
- More settings and apps
