{ callPackage, gccStdenv, z3_4_11, ... }:
let
  cvc4 = callPackage ../cvc4/default.nix {};
  solc-0_8_0 = callPackage ./0.8.0.nix { inherit cvc4; };
  solc-0_8_7 = callPackage ./0.8.7.nix { inherit cvc4; z3 = z3_4_11; };
  solc-0_8_13 = callPackage ./0.8.13.nix { inherit cvc4; };
in {
  inherit
  solc-0_8_13
  solc-0_8_7
  solc-0_8_0; }
