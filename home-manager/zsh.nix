{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      switch = "sudo darwin-rebuild switch --flake ~/.config/nix";
      ns = "nix-shell";

      # k = "kubectl";
      # urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      # urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };

    initContent = ''
      setopt extended_glob
      setopt dot_glob
      setopt null_glob

      # Setup the brew package manager for GUI apps
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  # fast node manager
  # eval "$(fnm env --use-on-cd --shell zsh)"
}
