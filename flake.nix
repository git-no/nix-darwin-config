{
  description = "Nix Darwin configuration for macOS";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixpkgs-25.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    darwin.url = "github:nix-darwin/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # home-manager, used for managing user configuration
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # mac-app-util.url = "github:hraban/mac-app-util";

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
      # mac-app-util,
      ...
    }:
    let
      lib = nixpkgs.lib;

      # Every subdirectory of ./hosts is one machine. Its default.nix declares
      # that machine's hostname/username/system/stateVersion. Adding a new
      # host only requires a new hosts/<name>/default.nix, no edits here.
      hostsDir = ./hosts;
      hostNames = builtins.attrNames (
        lib.filterAttrs (_name: type: type == "directory") (builtins.readDir hostsDir)
      );

      mkHost =
        hostName:
        let
          hostPath = hostsDir + "/${hostName}";
          host = import (hostPath + "/default.nix");
          inherit (host) username system stateVersion;
          hostname = host.hostname or hostName;

          specialArgs = inputs // {
            inherit username hostname stateVersion;
          };

          # Optional per-host nix-darwin overrides/extras, e.g.
          # hosts/<name>/configuration.nix for a different app selection or
          # different hardware-specific system.nix settings. Only included
          # if the file actually exists.
          hostConfigPath = hostPath + "/configuration.nix";
          hostModules = lib.optional (builtins.pathExists hostConfigPath) hostConfigPath;
        in
        darwin.lib.darwinSystem {
          inherit system specialArgs;
          modules = [
            ./modules/nix-core.nix
            ./modules/system.nix
            ./modules/apps.nix
            ./modules/host-users.nix
          ]
          ++ hostModules
          ++ [
            (
              { ... }:
              {
                system.primaryUser = username;
              }
            )

            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = import ./home-manager;
              home-manager.sharedModules = [
                # mac-app-util.homeManagerModules.default
              ];
            }
          ];
        };

      systems = lib.unique (
        map (hostName: (import (hostsDir + "/${hostName}/default.nix")).system) hostNames
      );
    in
    {
      darwinConfigurations = lib.genAttrs hostNames mkHost;

      # nix code formatter, one per system architecture actually used by a host
      formatter = lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
    };
}
