{
  description = "Jack's Personal NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    superfreq.url = "github:chakany/watt/fix/power-detection-logic";
    superfreq.inputs.nixpkgs.follows = "nixpkgs";
  };

    nixConfig = {
      experimental-features = ["nix-command" "flakes"];

      allowUnfree = true;
    };

  outputs = inputs @ { self, flake-parts, nixpkgs, home-manager, superfreq, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.home-manager.flakeModules.home-manager
      ];

      systems = [ "x86_64-linux" "aarch64-darwin" ];

      flake = {
        homeConfigurations = {
        laptop = let
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
          in
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              modules = [
                ./users/jack/home.nix
		./hosts/laptop.nix
                ./home/core.nix
              ];

              extraSpecialArgs = inputs;
            };

          steam-deck = let
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
          in
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [
                ./users/deck.nix
                ./home/core.nix
              ];

              extraSpecialArgs = inputs;
            };
        };
        nixosConfigurations = {
          jawnson =
            nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";

              modules = [
                ./hosts/jawnson
                ./users/jack/home.nix
                ./users/jack/nixos.nix

                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = inputs;
                  home-manager.users.jack = import ./home/core.nix;
                }
              ];
            };
        };
      };
    };
}
