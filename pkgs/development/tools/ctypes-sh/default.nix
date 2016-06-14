{ stdenv, fetchFromGitHub, libffi, autoconf, automake, libtool, pkgconfig }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "ctypes-sh";
  version = "git-2016-06-18";

  src = fetchFromGitHub {
    repo = "ctypes.sh";
    owner = "taviso";
    rev = "d7a80ea8eec71200f2968a38ecd89833dea892c8";
    sha256 = "0i8rm64phxpc49qp4s14bjaxscrjcxb577skhx23g7jbxvb85iz3";
  };

  buildInputs = [ libffi autoconf automake libtool pkgconfig ];
  preConfigure = "./autogen.sh";

  meta = with stdenv.lib; {
    description = "A foreign function interface for bash";
    homepage = https://github.com/taviso/ctypes.sh;
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ igsha ];
  };
}
