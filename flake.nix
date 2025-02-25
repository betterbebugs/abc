{
  description = ":)";

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;
      flake = {
        nixosConfigurations = import ./hosts {inherit inputs;};

        # lib.niv = import ./nix/sources.nix;
      };

    #   imports = [
    #     ./flake/shells.nix
    #     ./flake/pkgs
    #   ];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default-linux";

    # ags = {
    #   url = "github:Aylur/ags/v1";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hm = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; # What even is this fuf
    # hyprcontrib = {
    #   url = "github:hyprwm/contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # agenix = {
    #   url = "github:ryantm/agenix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # disko = {
    #   url = "github:nix-community/disko";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # impermanence.url = "github:nix-community/impermanence";
  };
}