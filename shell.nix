let
  pkgs = import <nixpkgs> {};
  lisps = pkgs.lispPackages;
in
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.sqlite
    pkgs.roswell
    pkgs.sbcl
    lisps.quicklisp
  ];
}
