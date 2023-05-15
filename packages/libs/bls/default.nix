{
  cmake,
  clang,
  fetchFromGitHub,
  gmpxx,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "bls";
  version = "1.35";

  src = fetchFromGitHub {
    owner = "herumi";
    repo = "bls";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-fHwNiZ0B5ow9GBWjO5c+rpK/jlziaMF5Bh+HQayIBUI=";
  };

  nativeBuildInputs = [cmake clang];
  buildInputs = [gmpxx];

  # ETH2.0 spec
  CFLAGS = [''-DBLS_ETH -DCMAKE_CXX_COMPILER=clang++''];

  meta = {
    description = "BLS threshold signature";
    homepage = "https://github.com/herumi/bls";
    platforms = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
  };
}
