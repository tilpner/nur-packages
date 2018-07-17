{ callPackage }:

with builtins;
dir:
  let
    list = readDir dir;
  in listToAttrs (map
    (name: {
      name = replaceStrings [".nix"] [""] name;
      value = callPackage (dir + ("/" + name)) {};
    })
    (attrNames list))

