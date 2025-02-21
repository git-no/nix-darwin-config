{
  description = "My nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.neovim
        ];

      # To turn off nix-darwin’s management of the Nix installation, set:
      nix.enable = false;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on. [aarch64-darwin, x86_64-darwin]
      nixpkgs.hostPlatform = "x86_64-darwin";

      # Custom settings
      security.pam.enableSudoTouchIdAuth = true;
      system.defaults = {
        dock.autohide = true;  # macOS dock hides automatically
        dock.mru-spaces = false;  # Don’t rearrange spaces based on the most recent use
        screensaver.askForPasswordDelay = 10;  # Only ask for a password in the screensaver if it is running for longer than 10 seconds
        .GlobalPreferences = {
          com.apple.mouse.scaling = 3;
        };
      };
    };
    homeconfig = { pkgs, ... }: {
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
      home.packages = with pkgs; [];
      
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."wilde13" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalsPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.verbose = true;
          home-manager.users."lukas".packages = homeconfig;  
        }
      ];
    };
  };
}
