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

      export PNPM_HOME="$HOME/Library/pnpm"
      case ":$PATH:" in
        *":$PNPM_HOME/bin:"*) ;;
        *) export PATH="$PNPM_HOME/bin:$PATH" ;;
      esac

      # Non-secret defaults for using Claude Code via OpenRouter.
      # export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
      # export ANTHROPIC_API_KEY=""

      # OPENROUTER_API_KEY lives outside git in ~/.config/nix/secrets/,
      # see secrets/openrouter.zsh.example for the expected format.
      if [[ -f "$HOME/.config/nix/secrets/openrouter.zsh" ]]; then
        # source "$HOME/.config/nix/secrets/openrouter.zsh"
        # export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
      fi
    '';
  };

  # fast node manager
  # eval "$(fnm env --use-on-cd --shell zsh)"
}
