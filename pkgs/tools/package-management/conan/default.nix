{ stdenv, fetchurl, pythonPackages }:

pythonPackages.buildPythonApplication rec {
  name = "${pname}-${version}";
  version = "0.14.1";
  pname = "conan";

  src = fetchurl {
    url = "mirror://pypi/c/${pname}/${name}.tar.gz";
    sha256 = "02f62nnr8a87qgzp38kc48xmklb5w82vhlsfpn4kj952hskyn81x";
  };

  propagatedBuildInputs = with pythonPackages;
    [ requests2 fasteners boto pyyaml pyjwt colorama patch bottle passlib six sqlite3 ];

  meta = with stdenv.lib; {
    homepage = https://www.conan.io;
    description = "A distributed, open source, package manager for C/C++";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ igsha ];
  };
}
