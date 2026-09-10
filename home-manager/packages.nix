{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    # pnpm # pnpm 1 selber installiert, weil nix es nicht zeitnah anietet
    nixfmt
  ];
}

# 3. Auf nixpkgs warten / PR verfolgen
# Unter github.com/NixOS/nixpkgs nach "pnpm 12" suchen – sobald ein PR gemergt ist, reicht es pnpm_12 in packages.nix einzutragen.
# https://github.com/NixOS/nixpkgs/tree/nixos-unstable/pkgs/development/tools/pnpm
