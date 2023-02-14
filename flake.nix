{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs { inherit system; };
    solcVersions = pkgs.callPackage ./nix/solc/versions.nix {};
  in
  {

    packages = {
      inherit (solcVersions) solc-0_8_13 solc-0_8_7 solc-0_8_0;

      default = pkgs.hello;
    };

    devShell =
      pkgs.mkShell {
        inputsFrom = [ ];
        packages = with pkgs; [ solc ];
        hardeningDisable = [ "all" ];
      };

  });
}
