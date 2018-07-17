{ stdenvNoCC, makeWrapper, bash, xmlstarlet }:

stdenvNoCC.mkDerivation {
  name = "tungsten";
  src = ./tungsten;

  buildInputs = [ bash xmlstarlet ];
  nativeBuildInputs = [ makeWrapper ];

  buildCommand = ''
    install -D $src $out/bin/tungsten
    wrapProgram $out/bin/tungsten \
      --prefix PATH : ${xmlstarlet}/bin
  '';
}
