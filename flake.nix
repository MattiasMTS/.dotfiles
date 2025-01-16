{
  description = "nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

  };
  outputs = {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nix-homebrew,
      ...
    } @ inputs: let
      username = "mattiassjodin";
      system = "aarch64-darwin";
      hostname = "Mattiass-MacBook-Pro-2";
      inherit (self) outputs;
    in {
      # Build darwin flake using:
      # darwin-rebuild switch --flake ~/nix
      darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
          system = system;
          specialArgs = {inherit inputs;};
          modules = [
            # `nix-darwin` config
            ./modules/darwin/default.nix
            ./modules/darwin/system.nix

            # `home-manager` config
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./home;
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
            # `nix-homebrew` config
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                # Install Homebrew under the default prefix
                enable = true;

                # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                enableRosetta = true;

                # User owning the Homebrew prefix
                user = username;

                # Automatically migrate existing Homebrew installations
                autoMigrate = true;
              };
            }
          ];
        };
    };
}
