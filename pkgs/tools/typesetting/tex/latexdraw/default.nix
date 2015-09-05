{ stdenv, fetchurl, unzip, jdk, makeWrapper }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "latexdraw-${version}";
  version = "3.3.2";
  exename = "LaTeXDraw";

  src = fetchurl {
    url = "mirror://sourceforge/latexdraw/${version}/${exename}-${version}-bin.zip";
    sha256 = "05b9x0lymnzfxxdnrw3li2j1fyddzzmi4fx724vrdc75qp2zvxjs";
  };

  buildInputs = [ unzip jdk makeWrapper ];

  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p $out/{bin,data,share/latexdraw}
    cp -r data/lib data/${exename}.jar $out/data/
    cp data/templates/* release_note.txt license.txt $out/share/latexdraw/
    makeWrapper ${jdk}/bin/java $out/bin/${exename} --add-flags "-jar ${exename}.jar" --run "cd $out/data"
  '';

  meta = {
    description = "A graphical drawing editor for LaTeX";
    homepage = http://latexdraw.sourceforge.net;
    platforms = platforms.all;
    license = licenses.lgpl2;
  };
}
