{ username, pkgs, ... }:

{
  # import sub modules
  imports = [
    ./shell.nix
    # ./core.nix
    ./zsh.nix
    ./git.nix
    # ./starship.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    # https://nixos.org/manual/nixos/unstable/release-notes
    stateVersion = "24.11";
  };

  home.packages = with pkgs; [
    # vscode,
    obsidian
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}