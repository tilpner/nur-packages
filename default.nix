{ pkgs }:

let
  callDirectory = import lib/callDirectory.nix { inherit (pkgs) callPackage; };
in (callDirectory ./pkgs) // {
  lib = callDirectory ./lib;
}
