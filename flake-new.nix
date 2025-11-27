{
  # source: https://github.com/ironicbadger/nix-config/blob/main/flake.nix
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
    }


    # Utilities for Mac App launchers
    # mac-app-util.url = "github:hraban/mac-app-util";

    # Secret management with sops-nix
    # sops-nix = {
    #   url = "github:Mic92/sops-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  }


  outputs =
    { ... }@inputs:
    with inputs;
    let
      inherit (self) outputs;

      stateVersion = "24.11";
      libx = import ./new/lib { inherit inputs outputs stateVersion; };

    in
    {

      darwinConfigurations = {
        # personal
        betty-blue = libx.mkDarwin { hostname = "BettyBlue"; };
        wilde13 = libx.mkDarwin { hostname = "wilde13"; };

        # work
      };

      colmena = {
        meta = {
          nixpkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
          specialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              self
              ;
          };
        };

        defaults =
          {
            lib,
            config,
            name,
            ...
          }:
          {
            imports = [
              inputs.home-manager.nixosModules.home-manager
            ];
          };

        # wd
        # morphnix = import ./new/hosts/nixos/morphnix;
        # nvllama = import ./new/hosts/nixos/nvllama;

        # test system
        # yeager = nixosSystem "x86_64-linux" "yeager" "alex";
      };
    };

};