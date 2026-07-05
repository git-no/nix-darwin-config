{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    bun
    pnpm
    nixfmt
  ];
}
