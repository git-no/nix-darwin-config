{ pkgs, ... }:
{

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  # environment.systemPackages = with pkgs; [
  #   git
  # ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    taps = [
      "oven-sh/bun"
    ];
    brews = [
      "mole"
      "container"
      "oven-sh/bun/bun"
      "python3"
    ];

    # https://formulae.brew.sh
    casks = [
      # "hammerspoon"
      # "amethyst"
      # "alfred"
      # "logseq"
      # "discord"
      # {
      #   name = "1password";
      #   greedy = true;
      # }
      # {
      #   name = "anytype"; # Obsidian alternative, but not as good as Obsidian
      #   greedy = true;
      # }
      {
        # remove apps completely, not just move to trash
        name = "appcleaner";
        greedy = true;
      }
      # {
      # Fehler bei Installation, 3/2026
      #   name = "expressvpn";
      #   greedy = true;
      # }
      {
        # AI assistant
        name = "claude";
        greedy = true;
      }
      {
        # Clock screensaver
        name = "fliqlo";
        greedy = true;
      }
      {
        # image viewer
        name = "flowvision";
      }
      {
        # Keyboard management
        name = "fluor";
        greedy = true;
      }
      {
        # Terminal app
        name = "ghostty";
        greedy = true;
      }
      {
        # Media player
        name = "iina";
        greedy = true;
      }
      {
        # menu bar management
        name = "thaw";
        greedy = true;
      }
      # {
      # installed directly by download the app
      #   name = "little-snitch";
      #   # greedy = true;
      # }
      {
        # Collaboration tool
        name = "microsoft-teams";
        greedy = true;
      }
      {
        # Monitor control utility
        name = "monitorcontrol";
        greedy = true;
      }
      {
        # Note-taking app
        name = "obsidian";
        greedy = true;
      }
      {
        # Cloud storage service
        name = "onedrive";
        greedy = true;
      }
      {
        # Office suite
        name = "onlyoffice";
        greedy = true;
      }
      {
        # Password manager
        name = "proton-pass";
        greedy = true;
      }
      {
        # VPN service
        name = "protonvpn";
        greedy = true;
      }
      {
        # FTP - File transfer client
        name = "transmit";
        greedy = true;
      }
      {
        # Usenet client
        name = "usenapp";
        greedy = true;
      }
      {
        # Code editor
        name = "visual-studio-code";
        greedy = true;
      }
      # workaround https://www.reddit.com/r/MacOS/comments/1eqbq37/macos_sonoma_or_later_apply_your_own_dynamic/
      # Vergleich: https://gifpaper.com/guide/animated-moving-wallpapers/
      # wie geht das technisch
      # wie trennen sie video von audio, audio läuft länger
      # {
      # habe jetzt meine eigene Wallpaper-App programmiert :-)
      #   name = "wallspace"; # "wallper"; # vs. wallspace, gifpaper, wallux
      #   greedy = true;
      # }
      {
        # RDP client
        name = "windows-app";
        greedy = true;
      }
    ];
  };
}
