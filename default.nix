let
  pkgs = import <nixpkgs> {};
  drv = pkgs.haskellPackages.callCabal2nix "set-monad" ./. {};
  env = drv.overrideAttrs (o: {
    nativeBuildInputs = o.nativeBuildInputs ++ [ pkgs.cabal-install ];
  });
in
  if pkgs.lib.inNixShell then env else drv
