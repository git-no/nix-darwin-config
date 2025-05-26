{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # initExtra = ''
    #   export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    # '';
  };


  # Füge Node.js zu den Home-Paketen hinzu
  home.packages = with pkgs; [
    nodejs # Standard-Node.js-Version
    bun
    # nodejs-18_x # Alternativ: spezifische Node.js-Version
  ];

  # # Optional: Shell-Aliase oder andere Anpassungen
  # home.shellAliases = {
  #   nodev = "node --version"; # Alias, um die Node.js-Version schnell zu prüfen
  # };

  # $PATH 5/2025 => /Users/lukas/.nix-profile/bin:/etc/profiles/per-user/lukas/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/lukas/Library/Application Support/Code/User/globalStorage/github.copilot-chat/debugCommand

  # home.shellAliases = {
  #   k = "kubectl";

  #   urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
  #   urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  # };
}