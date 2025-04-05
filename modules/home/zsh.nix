{
  lib,
  programs,
  ...
}: {

  programs.zsh = {
      enable = true;
      shellAliases = {
          switch = "darwin-rebuild switch --flake ~/.config/nix";
      };
  };
}