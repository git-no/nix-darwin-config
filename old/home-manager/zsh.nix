{
  lib,
  programs,
  ...
}:
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      switch = "sudo darwin-rebuild switch --flake ~/.nix-config";
      ns = "nix-shell";
    };
    # shellenv

    initContent = ''
      # Setup the brew package manager for GUI apps
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  # fast node manager
  # eval "$(fnm env --use-on-cd --shell zsh)"

  # activate bun https://www.reddit.com/r/NixOS/comments/1f7qvj2/how_do_you_run_brew_update_on_a_nixdarwin_system/
  # programs.zsh.initExtra = ''
  #     # Setup the brew package manager for GUI apps
  #     eval "$(/opt/homebrew/bin/brew shellenv)"

}
