{
  description = "Python + CUDA dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://cache.glepage.com"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.glepage.com:iaI4fkpeSy8sg8u5M8KnMsl4mSS1vwMYWj+ipqz9ugg="
    ];
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        config = {
          cudaSupport = true;
          allowUnfree = true;
        };
        inherit system;
      };
    in
    {
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
    };
}
