{
  description = "Nix Darwin configuration for macOS";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";

    # home-manager, used for managing user configuration
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    mac-app-util.url = "github:hraban/mac-app-util";

  };

  # The `outputs` function will return all the build results of the flake.
  # A flake can have many use cases and different types of outputs,
  # parameters in `outputs` are defined in `inputs` and can be referenced by their names.
  # However, `self` is an exception, this special parameter points to the `outputs` itself (self-reference)
  # The `@` syntax here is used to alias the attribute set of the inputs's parameter, making it convenient to use inside the function.
  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      home-manager,
      mac-app-util,
      ...
    }:
    let
      # TODO replace with your own username, system and hostname
      username = "lukas";
      hostname = "BettyBlue";
      system = "aarch64-darwin"; # aarch64-darwin or x86_64-darwin
      stateVersion = "24.05";

      specialArgs = inputs // {
        inherit username hostname;
      };
    in
    {
      darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/apps.nix
          # ./modules/homebrew-mirror.nix
          ./modules/host-users.nix

          mac-app-util.darwinModules.default

          # home manager
          (
            { pkgs, ... }:
            {
              system.primaryUser = "lukas";
              # Weitere Konfigurationen...
            }
          )

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.${username} = import ./home-manager;
            home-manager.sharedModules = [
              mac-app-util.homeManagerModules.default
            ];
          }
        ];
      };

      # nix code formatter
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
    };
}
