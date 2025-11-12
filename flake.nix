{
  description = "Python + CUDA dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos-cuda.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
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
