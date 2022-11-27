let
  pkgs = import <nixpkgs> {};
  lisps = pkgs.lispPackages;
in
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.roswell
    pkgs.sbcl
    lisps.quicklisp
  ];
}
