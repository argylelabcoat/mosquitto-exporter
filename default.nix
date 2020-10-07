{ pkgs ? import <nixpkgs>{} }:
with pkgs;
stdenv.mkDerivation {
  name = "mosquitto-prometheus-export";

  src = fetchFromGithub {
    owner = "argylelabcoat";
    repo = "mosquitto-exporter";
    rev = "master";
    sha256 = "00000000000qydqhp6nnj3c58c2115p4z6aalcih6jz44kj9927m";
  };

  buildPhase = ''
    go build
  '';

  installphase = ''
    mkdir $out/bin
    cp mqtt.sys.prometheus.export $out/bin
  '';

  nativeBuildInputs = [ go ];
  meta = {
    homepage = "https://github.com";
    description = "";
    license = stdenv.lib.licenses.apache20;
    platforms = stdenv.lib.platforms.unix;
  };
}
