{ callPackage }:

let
  callDirectory = import lib/callDirectory.nix { inherit callPackage; };
in (callDirectory ./pkgs) // {
  lib = callDirectory ./lib;
}
