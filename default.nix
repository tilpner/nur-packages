{ pkgs }:

let
  listDirectory = import lib/listDirectory.nix;
  importDirectory = listDirectory import;
  callDirectory = listDirectory (p: pkgs.callPackage p {});

  pkgs' = callDirectory ./pkgs;
in pkgs' // {
  pkgs = pkgs';
  lib = importDirectory ./lib;
  modules = importDirectory ./modules;
}
