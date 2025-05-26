{ pkgs, ...}: {

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
    
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    # onActivation.cleanup = "uninstall";
    
    taps = [
      "oven-sh/bun" 
    ];
    brews = [];

    # https://formulae.brew.sh
    casks = [
      # "hammerspoon"
      # "amethyst"
      # "alfred"
      # "logseq"
      # "discord"
      "1password"
      "appcleaner"
      "fliqlo"
      "fluor"
      "iina"
      "jordanbaird-ice"
      "little-snitch"
      "microsoft-teams"
      "monitorcontrol"
      "onedrive"
      "proton-pass"
      "protonvpn"
      "tower"
      "transmit"
      "windows-app"
      "visual-studio-code"
      "usenapp"
    ];
  };
}
