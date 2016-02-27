{ stdenv, fetchFromGitHub, pythonPackages }:

pythonPackages.buildPythonApplication rec {
  pname = "selfspy";
  version = "git-2016-02-07";
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "gurgeh";
    repo = pname;
    rev = "a98a9c06d14b6f8b6ad76948ab75a2f09c89c578";
    sha256 = "0d0qvq7s229pcdp11bpwgganj94yh6c22s8qyb0gb7vcn3dydxb3";
  };

  propagatedBuildInputs = with pythonPackages;
    [ lockfile pycrypto keyrings-alt keyring sqlalchemy9 xlib tkinter ];

  # no tests
  doCheck = false;

  meta = with stdenv.lib; {
    description = "A daemon that continuously monitors and stores what you are doing on your computer";
    license = licenses.gpl3;
    maintainers = [ maintainers.igsha ];
    platforms = platforms.all;
  };
}

