{ pkgs, ... }:

###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  # Add ability to used TouchID for sudo authentication
  # security.pam.enableSudoTouchIdAuth = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  # defaults = {
  #   # set the default mouse speed
  #   com.apple.mouse.scaling = "2.5";
  #   # set the default trackpad speed
  #   com.apple.trackpad.scaling = "2.5";
  # };

  # network computername, hostname, network name
  networking = {
    # knownNetworkServices = [ "Wi-Fi" "Ethernet Adaptor" "Thunderbolt Ethernet" ];
    knownNetworkServices = [
      "USB 10/100/1000 LAN"
      "Thunderbolt Bridge"
      "Wi-Fi"
    ];
    dns = [
      "9.9.9.9"
      "149.112.112.112"
      "2620:fe::fe"
      "2620:fe::9"
    ]; # Quad9, muss in vpn extra gesetzt werden
    applicationFirewall = {
      enable = true; # enable application firewall
      allowSigned = true; # allow signed applications to receive incoming connections
      enableStealthMode = true; # enable stealth mode
    };
  };

  system = {
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    # activationScripts.postUserActivation.text = ''
    # activateSettings -u will reload the settings from the database and apply them to the current session,
    # so we do not need to logout and login again to make the changes take effect.
    # /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    # '';

    # https://github.com/nix-darwin/nix-darwin/tree/master/modules
    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      # security: firewall, secure dns, gatekeeper, filevault, filter ads

      # Firewall
      # alf = {
      #   globalstate = 1; # 0 = off, 1 = on, 2 = on with stealth mode
      # };

      dock = {
        autohide = true;
        orientation = "bottom";
        showhidden = true;
        mineffect = "genie";
        launchanim = true;
        show-process-indicators = true;
        tilesize = 48;
        static-only = false;
        mru-spaces = false;
        show-recents = true;
        wvous-bl-corner = 5; # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-system.defaults.dock.wvous-bl-corner
        persistent-apps = [
          "/Applications/Safari.app"
          "/Applications/Ghostty.app"
        ];
      };

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };

      # Trackpad
      CustomUserPreferences."com.apple.trackpad".scaling = 1.0;
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
        Dragging = true;
      };

      # Mouse
      CustomUserPreferences."com.apple.mouse".scaling = 2.5;
      magicmouse = {
        MouseButtonMode = "TwoButton";
      };

      # screencapture = {
      #   location = "~/Desktop";
      #   type = "png";
      # }

      finder = {
        # _FXShowPosixPathInTitle = true; # show full path in finder title
        # AppleShowAllExtensions = true; # show all file extensions
        # FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        # QuitMenuItem = true; # enable quit menu item
        # ShowPathbar = true; # show path bar
        # ShowStatusBar = true; # show status bar

        # ShowExternalHardDrivesOnDesktop = true;
        # ShowHardDrivesOnDesktop = true;
        # ShowMountedServersOnDesktop = true;
        # ShowRemovableMediaOnDesktop = true;
        # _FXSortFoldersFirst = true;
        # # When performing a search, search the current folder by default
        # FXDefaultSearchScope = "SCcf";
      };

      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        # "com.apple.mail" = {
        #   # Disable inline attachments (just show the icons)
        #   DisableInlineAttachmentViewing = true;
        # };

        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
      };

    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # Fonts
  # fonts = {
  #   packages = with pkgs; [
  #     # icon fonts
  #     material-design-icons
  #     font-awesome

  #     # nerdfonts
  #     # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/data/fonts/nerdfonts/shas.nix
  #     (nerdfonts.override {
  #       fonts = [
  #         # symbols icon only
  #         "NerdFontsSymbolsOnly"
  #         # Characters
  #         "FiraCode"
  #         "JetBrainsMono"
  #         "Iosevka"
  #       ];
  #     })
  #   ];
  # };

}
