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
    brews = [ ];

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
      {
        name = "appcleaner";
        greedy = true;
      }
      {
        name = "fliqlo";
        greedy = true;
      }
      {
        name = "fluor";
        greedy = true;
      }
      {
        name = "iina";
        greedy = true;
      }
      # {
      #   name = "jordanbaird-ice";
      #   greedy = true;
      # }
      {
        name = "little-snitch";
        # greedy = true;
      }
      {
        name = "microsoft-teams";
        greedy = true;
      }
      {
        name = "monitorcontrol";
        greedy = true;
      }
      {
        name = "onedrive";
        greedy = true;
      }
      {
        name = "proton-pass";
        greedy = true;
      }
      {
        name = "protonvpn";
        greedy = true;
      }
      {
        name = "transmit";
        greedy = true;
      }
      {
        name = "tower";
        greedy = true;
      }
      {
        name = "windows-app";
        greedy = true;
      }
      {
        name = "visual-studio-code";
        greedy = true;
      }
      {
        name = "usenapp";
        greedy = true;
      }
      {
        name = "lm-studio";
        greedy = true;
      }
    ];
  };
}
